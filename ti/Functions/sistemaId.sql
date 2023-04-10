USE DataCorp 
GO


CREATE OR ALTER FUNCTION [ti].[sistemaId]
(
  @nome CHAR(64)       -- AK da tabela
)
RETURNS BIGINT
AS
BEGIN
  DECLARE @Id BIGINT
  SELECT @Id = [sisId]
    FROM [ti].[sistemas]
    WHERE [nome] = @nome
  IF @@ROWCOUNT = 0
  BEGIN
    SET @Id = -1 -- ou qualquer outra constante significativa
  END
  RETURN @Id
END
GO

