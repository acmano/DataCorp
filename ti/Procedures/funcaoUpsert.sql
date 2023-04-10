USE DataCorp
GO

CREATE OR ALTER PROCEDURE [ti].[funcaoUpsert]
(
  @sistemaNome      VARCHAR(64)   -- AK da tabela
, @linguagemNome    VARCHAR(64)   -- AK da tabela
, @programaNome     VARCHAR(64)   -- AK da tabela
, @funcaoNome       VARCHAR(64)   -- AK da tabela
, @funcaoDescricao  VARCHAR(256)  -- demais dados
)
AS
BEGIN
  SET NOCOUNT ON;
  DECLARE @programaId BIGINT
  DECLARE @funcaoId BIGINT
  DECLARE @funcaoProgramaId BIGINT
  DECLARE @colunaObjetoId BIGINT
  DECLARE @ErrorMessage NVARCHAR(4000)
  BEGIN TRY
    IF  [ti].[sistemaExiste] (@sistemaNome) = 0
      RAISERROR ( 'Sistema não cadastrado!', 16, 1 )
    IF  [ti].[programaExiste] (@sistemaNome, @linguagemNome, @programaNome) = 0
      RAISERROR ( 'Programa não cadastrado!', 16, 2 )
    BEGIN TRAN 
    IF  [ti].[funcaoExiste] (@sistemaNome, @linguagemNome, @programaNome, @funcaoNome) = 0
    BEGIN
      INSERT
        INTO [ti].[funcoes]
        (
          nome
        , descricao
        )
        VALUES
        (
          @funcaoNome
        , @funcaoDescricao
        )
      SET @funcaoId = scope_identity ()
    END
    ELSE
    BEGIN
      UPDATE  [ti].[funcoes]
        SET   descricao = @funcaoDescricao
        WHERE nome = @funcaoNome
      SET  @funcaoId   = [ti].[funcaoId]   (@sistemaNome, @linguagemNome, @programaNome, @funcaoNome)
    END
    SET @programaId = [ti].[programaID] (@sistemaNome, @linguagemNome, @programaNome)
    IF  [ti].[funcaoProgramaExiste] (@sistemaNome, @linguagemNome, @programaNome, @funcaoNome) = 0
      INSERT
        INTO [ti].[funcoesProgramas]
        (
          proId
        , funId
        )
        VALUES
        (
          @programaId
        , @funcaoId
        )
    ;
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