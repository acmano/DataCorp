USE DataCorp
GO

CREATE OR ALTER PROCEDURE [ti].[colunaUpsert]
(
  @bancoNome         VARCHAR(64)   -- AK da tabela
, @baseNome          VARCHAR(64)   -- AK da tabela
, @objetoTipoCodigo  CHAR(2)       -- AK da tabela
, @objetoNome        VARCHAR(256)  -- AK da tabela
, @colunaNome        VARCHAR(256)  -- AK da tabela
, @descricao         VARCHAR(256)  -- demais dados
)
AS
BEGIN
  SET NOCOUNT ON;
  DECLARE @objetoId BIGINT
  DECLARE @colunaId BIGINT
  DECLARE @ErrorMessage NVARCHAR(4000)
  BEGIN TRY
    IF  [ti].[bancoExiste]      (@bancoNome) = 0
      RAISERROR ( 'Banco de dados não cadastrado!', 16, 1 )
    IF  [ti].[baseExiste]       (@bancoNome, @baseNome) = 0
      RAISERROR ( 'Base de dados não cadastrada!', 16, 2 )
    IF  [ti].[objetoExiste]     (@bancoNome, @baseNome, @objetoTipoCodigo, @objetoNome) = 0
      RAISERROR ( 'Objeto não cadastrado!', 16, 3 )
    IF  [ti].[objetoTipoExiste] (@objetoTipoCodigo) = 0
      RAISERROR ( 'Tipo de Objeto não cadastrado!', 16, 5 )
    BEGIN TRAN 
    IF  [ti].[colunaExiste]     ( @colunaNome ) = 0
    BEGIN
      INSERT
        INTO [ti].[colunas]
        (
          nome
        , descricao
        )
        VALUES
        (
          @colunaNome
        , @descricao
        )
      SELECT @colunaId = SCOPE_IDENTITY()
    END
    ELSE
    BEGIN
      SET  @colunaId  = [ti].[colunaId] (@colunaNome)
      UPDATE  [ti].[colunas]
        SET   descricao = @descricao
        WHERE colId = @colunaId
    END
    IF [ti].[colunaObjetoExiste] ( @bancoNome, @baseNome, @objetoTipoCodigo, @objetoNome, @colunaNome) = 0
    BEGIN
      SET @objetoId = [ti].[objetoID] (@bancoNome, @baseNome, @objetoTipoCodigo, @objetoNome)
      INSERT
        INTO  [ti].[colunasObjetos]
        (
          [objId]
        , [colId]
        )
        VALUES
        (
          @objetoId
        , @colunaId
        )
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