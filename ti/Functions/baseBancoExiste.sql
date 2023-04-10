USE DataCorp 
GO


CREATE OR ALTER FUNCTION [ti].[baseBancoExiste]
(
  @bancoNome VARCHAR(64)       -- AK da tabela
, @baseNome  VARCHAR(64)       -- AK da tabela
)
RETURNS BIT
AS
BEGIN
  DECLARE @RecordExists BIT = 0
  IF EXISTS
  (
    SELECT  DISTINCT 1
      FROM  [ti].[bases] base
      INNER JOIN [ti].[basesBancos] baseBanco
        ON  baseBanco.basId
          = base.basId
      INNER JOIN [ti].[bancos] banco
        ON  banco.banId
          = baseBanco.banId
      WHERE banco.nome = @bancoNome
      AND   base.nome = @baseNome
  )
    SET @RecordExists = 1
  RETURN @RecordExists
END
GO

