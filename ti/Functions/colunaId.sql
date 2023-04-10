USE DataCorp
GO

CREATE OR ALTER FUNCTION [ti].[colunaId]
(
  @colunaNome       VARCHAR(256)  -- AK da tabela
)
RETURNS BIGINT
AS
BEGIN
  DECLARE @Id BIGINT
  SELECT @Id = coluna.colId
    FROM  [ti].[colunas] coluna
    WHERE coluna.nome = @colunaNome
  IF @@ROWCOUNT = 0
  BEGIN
    SET @Id = -1 -- ou qualquer outra constante significativa
  END
  RETURN @Id
END
GO

