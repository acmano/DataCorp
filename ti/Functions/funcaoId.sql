USE DataCorp
GO


CREATE OR ALTER FUNCTION [ti].[funcaoId]
(
  @sistemaNome  CHAR(64)      -- AK da tabela
, @linguagemNome CHAR(64)      -- AK da tabela
, @programaNome CHAR(64)      -- AK da tabela
, @funcaoNome   CHAR(64)      -- AK da tabela
)
RETURNS BIGINT
AS
BEGIN
  DECLARE @Id BIGINT
  SELECT @Id = funcao.funId
    FROM       [ti].[sistemas] sistema
    INNER JOIN [ti].[programasSistemas] programaSistema
      ON  programaSistema.sisId
        = sistema.sisId
    INNER JOIN [ti].[programas] programa
      ON  programa.proId
        = programaSistema.proId
    INNER JOIN [ti].[funcoesProgramas] funcaoPrograma
      ON  funcaoPrograma.proId
        = programa.proId
    INNER JOIN [ti].[funcoes] funcao
      ON  funcao.funId
        = funcaoPrograma.funId
    INNER JOIN [ti].[linguagensProgramas] linguagemPrograma
      ON  linguagemPrograma.proId
        = programa.proId
    INNER JOIN [ti].[linguagens] linguagem
      ON  linguagem.linId
        = linguagemPrograma.linId
    WHERE sistema.nome  = @sistemaNome
    AND   programa.nome = @programaNome
    AND   funcao.nome   = @funcaoNome
    AND   linguagem.nome = @linguagemNome
  IF @@ROWCOUNT = 0
  BEGIN
    SET @Id = -1 -- ou qualquer outra constante significativa
  END
  RETURN @Id
END
GO

