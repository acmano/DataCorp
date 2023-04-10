USE DataCorp
GO



CREATE OR ALTER FUNCTION [ti].[linguagemId]
(
  @nome VARCHAR(64)        -- AK da tabela
)
RETURNS BIGINT
AS
BEGIN
  DECLARE @Id BIGINT
  SELECT  @Id = linguagem.linId
    FROM  [ti].[linguagens] linguagem
    WHERE linguagem.nome  = @nome
  IF @@ROWCOUNT = 0
    SET @Id = -1 -- ou qualquer outra constante significativa
  RETURN @Id
END
GO

