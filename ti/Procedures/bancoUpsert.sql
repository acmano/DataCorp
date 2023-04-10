USE DataCorp
GO

CREATE OR ALTER PROCEDURE [ti].[bancoUpsert]
(
  @nome VARCHAR(64)        -- AK da tabela
, @descricao VARCHAR(128)  -- demais dados
)
AS
BEGIN
  SET NOCOUNT ON;
  DECLARE @ErrorMessage NVARCHAR(4000)
  BEGIN TRY
    BEGIN TRAN 
    MERGE [ti].[bancos] AS target
      USING (SELECT @nome, @descricao) AS source (nome, descricao)
        ON (target.nome = source.nome)
        WHEN MATCHED THEN
            UPDATE SET target.descricao = source.descricao
        WHEN NOT MATCHED THEN
            INSERT (nome, descricao)
            VALUES (source.nome, source.descricao)
        ;
    COMMIT TRAN
    END TRY
    BEGIN CATCH
      IF @@TRANCOUNT > 0
          ROLLBACK TRAN
      DECLARE @ErrorSeverity INT = ERROR_SEVERITY()
      DECLARE @ErrorState INT = ERROR_STATE()
      SET @ErrorMessage = ERROR_MESSAGE()
      RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
    END CATCH
END
GO