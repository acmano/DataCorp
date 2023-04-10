USE DataCorp 
GO


CREATE OR ALTER FUNCTION [ti].[objetoTipoId]
(
  @codigo VARCHAR(2)       -- AK da tabela
)
RETURNS BIGINT
AS
BEGIN
  DECLARE @Id BIGINT
  SELECT @Id = [objTipId]
    FROM [ti].[objetosTipos]
    WHERE [codigo] = @codigo
  IF @@ROWCOUNT = 0
  BEGIN
    SET @Id = -1 -- ou qualquer outra constante significativa
  END
  RETURN @Id
END
GO

