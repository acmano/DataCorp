USE DataCorp
GO

CREATE OR ALTER FUNCTION [ti].[baseId]
(
  @bancoNome VARCHAR(64)       -- AK da tabela
, @baseNome VARCHAR(64)        -- AK da tabela
)
RETURNS BIGINT
AS
BEGIN
  DECLARE @Id BIGINT
  SELECT  @Id = base.basId
    FROM  [ti].[bancos] banco
    INNER JOIN [ti].[basesBancos] baseBanco
      ON  baseBanco.banId
        = banco.banId
    INNER JOIN [ti].[bases] base
      ON  base.basId
        = baseBanco.basId
    WHERE banco.nome = @bancoNome
    AND   base.nome  = @baseNome
  IF @@ROWCOUNT = 0
    SET @Id = -1 -- ou qualquer outra constante significativa
  RETURN @Id
END
GO

