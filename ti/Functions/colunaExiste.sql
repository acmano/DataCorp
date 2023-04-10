USE DataCorp
GO

CREATE OR ALTER FUNCTION [ti].[colunaExiste]
(
  @colunaNome       VARCHAR(256)  -- AK da tabela
)
RETURNS BIT
AS
BEGIN
  DECLARE @RecordExists BIT = 0
  IF EXISTS
  (
    SELECT  DISTINCT 1
      FROM  [ti].[colunas] coluna
      WHERE coluna.nome = @colunaNome
  )
    SET @RecordExists = 1
  RETURN @RecordExists
END
GO

