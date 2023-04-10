USE DataCorp
GO

CREATE OR ALTER FUNCTION [ti].[bancoId]
(
  @nome VARCHAR(64)       -- AK da tabela
)
RETURNS BIGINT
AS
BEGIN
  DECLARE @Id BIGINT
  SELECT @Id = [banId]
    FROM [ti].[bancos]
    WHERE [nome] = @nome
  IF @@ROWCOUNT = 0
  BEGIN
    SET @Id = -1
  END
  RETURN @Id
END
GO

