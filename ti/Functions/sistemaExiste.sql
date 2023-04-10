USE DataCorp 
GO


CREATE OR ALTER FUNCTION [ti].[sistemaExiste]
(
  @nome CHAR(64)       -- AK da tabela
)
RETURNS BIT
AS
BEGIN
  DECLARE @RecordExists BIT = 0
  IF EXISTS
  (
    SELECT  DISTINCT 1
      FROM  [ti].[sistemas]
      WHERE nome = @nome
  )
    SET @RecordExists = 1
  RETURN @RecordExists
END
GO

