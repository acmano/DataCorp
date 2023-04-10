USE DataCorp 
GO

CREATE OR ALTER PROCEDURE [ti].[objetoTipoUpsert]
(
  @codigo    VARCHAR(2)    -- AK da tabela
, @descricao VARCHAR(128)  -- demais dados
)
AS
BEGIN
  SET NOCOUNT ON;
  DECLARE @ErrorMessage NVARCHAR(4000)
  BEGIN TRY
    BEGIN TRAN 
    MERGE [ti].[objetosTipos] AS target
      USING (SELECT @codigo, @descricao) AS source (codigo, descricao)
        ON (target.codigo = source.codigo)
        WHEN MATCHED THEN
            UPDATE SET target.descricao = source.descricao
        WHEN NOT MATCHED THEN
            INSERT (codigo, descricao)
            VALUES (source.codigo, source.descricao)
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
go