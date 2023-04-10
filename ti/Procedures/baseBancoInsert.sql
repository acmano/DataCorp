USE DataCorp 
GO

CREATE OR ALTER PROCEDURE [ti].[baseBancoInsert]
(
  @bancoNome VARCHAR(64)       -- AK da tabela
, @baseNome  VARCHAR(64)       -- AK da tabela
)
AS
BEGIN
  SET NOCOUNT ON;
  DECLARE @banId bigint
  DECLARE @basId bigint
  DECLARE @ErrorMessage NVARCHAR(4000)
  IF  [ti].[bancoExiste] (@bancoNome) = 0
    RETURN
  IF  [ti].[baseExiste] (@bancoNome, @baseNome) = 0
    RETURN
  BEGIN TRY
    SET @banId = [ti].[bancoId] ( @bancoNome)
    SET @basId = [ti].[baseId] ( @bancoNome, @baseNome)
    IF  @banId > 0
    AND @basId > 0
      BEGIN TRAN 
        INSERT
          INTO  [ti].[basesBancos]
          (
            [banId]
          , [basId]
          )
          VALUES
          (
            @banId
          , @basId
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