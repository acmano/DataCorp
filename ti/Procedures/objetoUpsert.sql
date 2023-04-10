USE DataCorp
GO

CREATE OR ALTER PROCEDURE [ti].[objetoUpsert]
(
  @bancoNome              VARCHAR(64)           -- AK da tabela
, @baseNome               VARCHAR(64)           -- AK da tabela
, @objetoTipoCodigo       CHAR(2)               -- AK da tabela
, @objetoNome             VARCHAR(256)          -- AK da tabela
, @objetoDescricao        VARCHAR(256)          -- demais dados
, @origemBancoNome        VARCHAR(64)   = NULL  -- AK da tabela
, @origemBaseNome         VARCHAR(64)   = NULL  -- AK da tabela
, @origemObjetoTipoCodigo CHAR(2)       = NULL  -- AK da tabela
, @origemObjetoNome       VARCHAR(256)  = NULL  -- AK da tabela
)
AS
BEGIN
  SET NOCOUNT ON;
  DECLARE @baseId BIGINT
  DECLARE @objetoId BIGINT
  DECLARE @objetoTipoId BIGINT
  DECLARE @origemBaseId BIGINT
  DECLARE @origemObjetoId BIGINT
  DECLARE @origemObjetoTipoId BIGINT
  DECLARE @ErrorMessage NVARCHAR(4000)
  BEGIN TRY
    IF  [ti].[bancoExiste] (@bancoNome) = 0
      RAISERROR ( 'Banco de dados não cadastrado!', 16, 1 )
    IF  [ti].[baseExiste] (@bancoNome, @baseNome) = 0
      RAISERROR ( 'Base de dados não cadastrada!', 16, 2 )
    IF  [ti].[objetoTipoExiste] (@objetoTipoCodigo) = 0
      RAISERROR ( 'Tipo de objeto não cadastrado!', 16, 3 )
    SET  @baseId   = [ti].[baseId] (@bancoNome, @baseNome)
    BEGIN TRAN 
    IF [ti].[objetoExiste] ( @bancoNome, @baseNome, @objetoTipoCodigo, @objetoNome) = 0
    BEGIN
      INSERT 
        INTO [ti].[objetos]
        (
          nome
        , descricao
        )
        VALUES
        (
          @objetoNome
        , @objetoDescricao
        )
      SELECT  @objetoId = SCOPE_IDENTITY ( )
    END
    ELSE
    BEGIN
      SET  @objetoId = [ti].[objetoId] (@bancoNome, @baseNome, @objetoTipoCodigo, @objetoNome)
      UPDATE  [ti].[objetos]
        SET   descricao = @objetoDescricao
        WHERE objId = @objetoId
    END
    IF  [ti].[objetoTipoObjetoExiste] (@bancoNome, @baseNome, @objetoTipoCodigo, @objetoNome) = 0
    BEGIN
      SET @objetoTipoId = [ti].[objetoTipoId] (@objetoTipoCodigo)
      INSERT
        INTO  [ti].[objetosTiposObjetos]
        (
          objTipId
        , objId
        )
        VALUES
        (
          @objetoTipoId
        , @objetoId
        )
    END
    IF  [ti].[objetoBaseExiste] (@bancoNome, @baseNome, @objetoTipoCodigo, @objetoNome) = 0
    BEGIN
      SET @baseId = [ti].[baseId] (@bancoNome, @baseNome)
      INSERT
        INTO  [ti].[objetosBases]
        (
          basId
        , objId
        )
        VALUES
        (
          @baseId
        , @objetoId
        )
    END
    IF  @origemBancoNome IS NOT NULL 
    AND @origemBaseNome IS NOT NULL
    AND @origemObjetoTipoCodigo IS NOT NULL
    AND @origemObjetoNome IS NOT NULL
    BEGIN
      IF  [ti].[objetoExiste] (@origemBancoNome, @origemBaseNome, @origemObjetoTipoCodigo, @origemObjetoNome) = 0
        RAISERROR ( 'Objeto origem não cadastrado!', 16, 4 )
      IF  [ti].[objetoOrigemExiste]
      (
        @bancoNome
      , @baseNome
      , @objetoTipoCodigo
      , @objetoNome
      , @origemBancoNome
      , @origemBaseNome
      , @origemObjetoTipoCodigo
      , @origemObjetoNome
      ) = 0
      BEGIN
        SET @origemObjetoId = [ti].[objetoId] (@origemBancoNome, @origemBaseNome, @origemObjetoTipoCodigo, @origemObjetoNome)
        INSERT
          INTO  [ti].[objetosOrigens]
          (
            objBasId
          , objBasOriId
          )
          VALUES
          (
            @objetoId
          , @origemObjetoId
          )
      END
    END
    COMMIT TRAN
    END TRY
    BEGIN CATCH
      -- Se ocorrer um erro, desfaz a transação
      IF @@TRANCOUNT > 0
          ROLLBACK TRAN
      -- Retorna uma mensagem de erro
      DECLARE @ErrorSeverity INT = ERROR_SEVERITY()
      DECLARE @ErrorState INT = ERROR_STATE()
      SET @ErrorMessage = ERROR_MESSAGE()
      RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
    END CATCH
END