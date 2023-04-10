USE DataCorp 
GO


CREATE OR ALTER FUNCTION [ti].[funcaoProgramaExiste]
(
  @sistemaNome   VARCHAR(64)       -- AK da tabela
, @linguagemNome VARCHAR(64)       -- AK da tabela
, @programaNome  VARCHAR(64)       -- AK da tabela
, @funcaoNome    VARCHAR(64)       -- AK da tabela
)
RETURNS BIT
AS
BEGIN
  DECLARE @RecordExists BIT = 0
  IF EXISTS
  (
    SELECT  DISTINCT 1
      FROM  [ti].[sistemas] sistema
      INNER JOIN [ti].[programasSistemas] programaSistema
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
      INNER JOIN [ti].[funcoesProgramas] funcaoPrograma
        ON  funcaoPrograma.proId
          = programa.proId
      INNER JOIN [ti].[funcoes] funcao
        ON  funcao.funId
          = funcaoPrograma.funId
      WHERE sistema.nome   = @sistemaNome
      AND   linguagem.nome = @linguagemNome
      AND   programa.nome  = @programaNome
      AND   funcao.nome    = @funcaoNome
  )
    SET @RecordExists = 1
  RETURN @RecordExists
END
GO

