USE DataCorp 
GO

CREATE OR ALTER FUNCTION [ti].[linguagemProgramaId]
(
  @sistemaNome    VARCHAR(64)       -- AK da tabela
, @linguagemNome  VARCHAR(64)       -- AK da tabela
, @programaNome   VARCHAR(64)       -- AK da tabela
)
RETURNS bigint
AS
BEGIN
  DECLARE @Id bigint
  SELECT  @Id = linguagemPrograma.linProId
    FROM  [ti].[sistemas] sistema
    INNER JOIN  [ti].[programasSistemas] programaSistema
      ON  programaSistema.sisId
        = sistema.sisId
    INNER JOIN [ti].[programas] programa
      ON  programa.proId
        = programaSistema.proId
    INNER JOIN [ti].[linguagensProgramas] linguagemPrograma
      ON  linguagemPrograma.proId
        = programa.proId
    INNER JOIN [ti].[linguagens] linguagem
      ON  linguagem.linId
        = linguagemPrograma.linId
    WHERE sistema.nome   = @sistemaNome
    AND   programa.nome  = @programaNome
    AND   linguagem.nome = @linguagemNome
  IF @@ROWCOUNT = 0
  BEGIN
    SET @Id = -1 -- ou qualquer outra constante significativa
  END
  RETURN @Id
END
GO