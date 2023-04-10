USE DataCorp 
GO

CREATE OR ALTER PROCEDURE [ti].[programaUpsert]
(
  @sistemaNome    VARCHAR(64)   -- AK da tabela
, @linguagemNome  VARCHAR(64)       -- AK da tabela
, @programaNome   VARCHAR(64)   -- AK da tabela
, @descricao      VARCHAR(128)  -- demais dados
)
AS
BEGIN
  SET NOCOUNT ON;
  DECLARE @sistemaId BIGINT
  DECLARE @linguagemId BIGINT
  DECLARE @programaId BIGINT
  DECLARE @ErrorMessage NVARCHAR(4000)
  BEGIN TRY
    IF  [ti].[sistemaExiste] ( @sistemaNome ) = 0
      RAISERROR ('Sistema não cadastrado!', 16, 1)
    IF  [ti].[linguagemExiste] ( @linguagemNome ) = 0
      RAISERROR ('Linguagem não cadastrada!', 16, 2)
    SET @sistemaId = [ti].[sistemaId] (@sistemaNome)
    BEGIN TRAN 
    IF  [ti].[programaExiste] ( @sistemaNome, @linguagemNome, @programaNome) = 0
    BEGIN
      INSERT
        INTO  [ti].[programas]
        (
          nome
        , descricao
        )
        VALUES
        (
          @programaNome
        , @descricao
        )
      SET @programaId = SCOPE_IDENTITY( )
    END
    ELSE
    BEGIN
      SET  @programaId = [ti].[programaId] (@sistemaNome, @linguagemNome, @programaNome)
      UPDATE  [ti].[programas]
        SET   descricao = @descricao
        WHERE proId = @programaId
    END
    IF  [ti].[linguagemProgramaExiste] (@sistemaNome, @linguagemNome, @programaNome) = 0
    BEGIN
      SET @linguagemId = [ti].[linguagemID] (@linguagemNome)
      INSERT
        INTO  [ti].[linguagensProgramas]
        (
          proId
        , linId
        )
        VALUES
        (
          @programaId
        , @linguagemId
        )
    END
    IF  [ti].[programaSistemaExiste] (@sistemaNome, @linguagemNome, @programaNome) = 0
    BEGIN
      SET @sistemaId = [ti].[sistemaID] (@sistemaNome)
      INSERT
        INTO  [ti].[programasSistemas]
        (
          sisId
        , proId
        )
        VALUES
        (
          @sistemaId
        , @programaId
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