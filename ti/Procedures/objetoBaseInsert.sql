USE DataCorp 
GO

CREATE OR ALTER PROCEDURE [ti].[objetoBaseInsert]
(
  @bancoNome        VARCHAR(64)       -- AK da tabela
, @baseNome         VARCHAR(64)       -- AK da tabela
, @objetoTipoCodigo CHAR(2)           -- AK da tabela
, @objetoNome       VARCHAR(256)      -- AK da tabela
)
AS
BEGIN
  SET NOCOUNT ON;
  DECLARE @basId bigint
  DECLARE @objId bigint
  DECLARE @ErrorMessage NVARCHAR(4000)
  IF  [ti].[baseExiste] (@bancoNome, @baseNome) = 0
    RETURN
  IF  [ti].[objetoExiste] (@bancoNome, @baseNome, @objetoTipoCodigo, @objetoNome) = 0
    RETURN
  BEGIN TRY
    SET @basId = [ti].[baseId] ( @bancoNome, @baseNome)
    SET @objId = [ti].[objetoId] ( @bancoNome, @baseNome, @objetoTipoCodigo, @objetoNome)
    IF  @basId > 0
    AND @objId > 0
      BEGIN TRAN 
        INSERT
          INTO  [ti].[objetosBases]
          (
            [basId]
          , [objId]
          )
          VALUES
          (
            @basId
          , @objId
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