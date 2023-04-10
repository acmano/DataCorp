USE DataCorp
GO


CREATE OR ALTER FUNCTION [ti].[funcaoExiste]
(
  @sistemaNome  CHAR(64)      -- AK da tabela
, @linguagemNome CHAR(64)      -- AK da tabela
, @programaNome CHAR(64)      -- AK da tabela
, @funcaoNome   CHAR(64)      -- AK da tabela
)
RETURNS BIT
AS
BEGIN
  DECLARE @RecordExists BIT = 0
  IF EXISTS
  (
    SELECT  DISTINCT 1
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
      INNER JOIN [ti].[linguagensProgramas] linguagemPrograma
        ON  linguagemPrograma.proId
         = programa.proId
      INNER JOIN [ti].[linguagens] linguagem
        ON  linguagem.linId
          = linguagemPrograma.linId
      INNER JOIN [ti].[funcoes] funcao
        ON  funcao.funId
          = funcaoPrograma.funId
      WHERE sistema.nome  = @sistemaNome
      AND   programa.nome = @programaNome
      AND   funcao.nome   = @funcaoNome
      AND   linguagem.nome = @linguagemNome
  )
    SET @RecordExists = 1
  RETURN @RecordExists
END
GO

