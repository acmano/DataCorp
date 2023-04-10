USE DataCorp 
GO


CREATE OR ALTER PROCEDURE [ti].[sistemaUpsert]
(
  @nome CHAR(64)        -- AK da tabela
, @descricao VARCHAR(128)  -- demais dados
)
AS
BEGIN
  SET NOCOUNT ON;
  DECLARE @Id BIGINT
  DECLARE @ErrorMessage NVARCHAR(4000)
  BEGIN TRY
    -- Verificar se o registro já existe e atualizá-lo
    BEGIN TRAN 
    MERGE [ti].[sistemas] AS target
      USING (SELECT @nome, @descricao) AS source (nome, descricao)
        ON (target.nome = source.nome)
        WHEN MATCHED
        THEN
          UPDATE
            SET  target.descricao
              =  source.descricao
        WHEN NOT MATCHED
        THEN
          INSERT (nome, descricao)
            VALUES (source.nome, source.descricao)
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