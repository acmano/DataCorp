USE DataCorp
GO

CREATE OR ALTER FUNCTION [ti].[baseExiste]
(
  @bancoNome VARCHAR(64)       -- AK da tabela
, @baseNome VARCHAR(64)        -- AK da tabela
)
RETURNS BIT
AS
BEGIN
  DECLARE @RecordExists BIT = 0
  IF  EXISTS
  (
    SELECT  DISTINCT 1
      FROM  [ti].[bancos] banco
      INNER JOIN [ti].[basesBancos] baseBanco
        ON  baseBanco.banId
          = banco.banId
      INNER JOIN [ti].[bases] base
        ON  base.basId
          = baseBanco.basId
      WHERE banco.nome = @bancoNome
      AND   base.nome  = @baseNome
  )
    SET @RecordExists = 1
  RETURN @RecordExists
END
GO

