USE DataCorp 
GO


CREATE OR ALTER FUNCTION [ti].[baseBancoId]
(
  @bancoNome VARCHAR(64)       -- AK da tabela
, @baseNome  VARCHAR(64)       -- AK da tabela
)
RETURNS bigint
AS
BEGIN
  DECLARE @Id bigint
  SELECT  @Id = baseBanco.basBanId
    FROM  [ti].[bases] base
    INNER JOIN [ti].[basesBancos] baseBanco
      ON  baseBanco.basId
        = base.basId
    INNER JOIN [ti].[bancos] banco
      ON  banco.banId
        = baseBanco.banId
    WHERE banco.nome = @bancoNome
    AND   base.nome = @baseNome
  IF @@ROWCOUNT = 0
  BEGIN
    SET @Id = -1 -- ou qualquer outra constante significativa
  END
  RETURN @Id
END
GO
