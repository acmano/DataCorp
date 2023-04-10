USE DataCorp 
GO

CREATE OR ALTER PROCEDURE [ti].[objetoTipoObjetoInsert]
(
  @bancoNome        VARCHAR(64)       -- AK da tabela
, @baseNome         VARCHAR(64)       -- AK da tabela
, @objetoTipoCodigo CHAR(2)           -- AK da tabela
, @objetoNome       VARCHAR(256)      -- AK da tabela
)
AS
BEGIN
  SET NOCOUNT ON;
  DECLARE @objId bigint
  DECLARE @objTipId bigint
  DECLARE @ErrorMessage NVARCHAR(4000)
  IF  [ti].[objetoExiste] (@bancoNome, @baseNome, @objetoTipoCodigo, @objetoNome) = 0
    RETURN
  IF  [ti].[objetoTipoExiste] (@objetoTipoCodigo) = 0
    RETURN
  BEGIN TRY
    SET @objId = [ti].[objetoId] ( @bancoNome, @baseNome, @objetoTipoCodigo, @objetoNome)
    SET @objTipId = [ti].[objetoTipoId] (@objetoTipoCodigo )
    IF  @objId > 0
    AND @objTipId > 0
      BEGIN TRAN 
        INSERT
          INTO  [ti].[objetosTiposObjetos]
          (
            [objId]
          , [objTipId]
          )
          VALUES
          (
            @objId
          , @objTipId
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