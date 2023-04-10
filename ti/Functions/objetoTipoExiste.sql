USE DataCorp 
GO


CREATE OR ALTER FUNCTION [ti].[objetoTipoExiste]
(
  @codigo CHAR(2)       -- AK da tabela
)
RETURNS BIT
AS
BEGIN
  DECLARE @RecordExists BIT = 0
  IF EXISTS
  (
    SELECT  DISTINCT 1
      FROM  [ti].[objetosTipos]
      WHERE codigo = @codigo
  )
    SET @RecordExists = 1
  RETURN @RecordExists
END
GO

