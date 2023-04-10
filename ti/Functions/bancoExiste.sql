USE DataCorp
GO

CREATE OR ALTER FUNCTION [ti].[bancoExiste]
(
  @nome VARCHAR(63)       -- AK da tabela
)
RETURNS BIT
AS
BEGIN
  DECLARE @RecordExists BIT = -1
  IF EXISTS
  (
    SELECT  DISTINCT 0
      FROM  [ti].[bancos]
      WHERE nome = @nome
  )
    SET @RecordExists = 0
  RETURN @RecordExists
END
GO

