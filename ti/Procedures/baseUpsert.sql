USE DataCorp
GO

CREATE OR ALTER PROCEDURE [ti].[baseUpsert]
(
  @bancoNome VARCHAR(64)   -- AK da tabela
, @baseNome  VARCHAR(64)   -- AK da tabela
, @descricao VARCHAR(128)  -- demais dados
)
AS
BEGIN
  SET NOCOUNT ON;
  DECLARE @bancoId BIGINT
  DECLARE @baseId BIGINT
  DECLARE @ErrorMessage NVARCHAR(4000)
  BEGIN TRY
    IF  [ti].[bancoExiste] (@bancoNome) = 0
      RAISERROR ( 'Banco de dados nao existe!', 16, 1 )
    SET  @bancoId = [ti].[bancoId] (@bancoNome)
    BEGIN TRAN 
    IF  [ti].[baseExiste] ( @bancoNome, @baseNome ) = 0
    BEGIN
      INSERT
        INTO [ti].[bases]
        (
          nome
        , descricao
        )
        VALUES
        (
          @baseNome
        , @descricao
        )
      SELECT @baseId = SCOPE_IDENTITY()
    END
    ELSE
    BEGIN
      SET  @baseId  = [ti].[baseId] (@bancoNome, @baseNome)
      UPDATE  [ti].[bases]
        SET   descricao = @descricao
        WHERE basId = @baseId
    END
    IF [ti].[baseBancoExiste] ( @bancoNome, @baseNome) = 0
      INSERT
        INTO  [ti].[basesBancos]
        (
          [banId]
        , [basId]
        )
        VALUES
        (
          @bancoId
        , @baseId
        )
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