USE DataCorp 
GO


CREATE OR ALTER FUNCTION [ti].[colunaFuncaoExiste]
(
  @sistemaNome      VARCHAR(64)   -- AK da tabela
, @programaNome     VARCHAR(64)   -- AK da tabela
, @funcaoNome       VARCHAR(64)   -- AK da tabela
, @bancoNome        VARCHAR(64)  = NULL 
, @baseNome         VARCHAR(64)  = NULL
, @objetoTipoCodigo CHAR(2)      = NULL
, @objetoNome       VARCHAR(256) = NULL
, @colunaNome       VARCHAR(256) = NULL
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
      INNER JOIN [ti].[funcoes] funcao
        ON  funcao.funId
          = funcaoPrograma.funId
      INNER JOIN [ti].[colunasFuncoes] colunaFuncao
        ON  colunaFuncao.funProId
          = funcaoPrograma.funProId
      INNER JOIN [ti].[colunasObjetos] colunaObjeto
        ON  colunaObjeto.colObjId
          = colunaFuncao.colObjId
      INNER JOIN [ti].[colunas] coluna
        ON  coluna.colId
          = colunaObjeto.colID
      INNER JOIN [ti].[objetos] objeto
        ON  objeto.objId
          = colunaObjeto.objId
      INNER JOIN [ti].[objetosTiposObjetos] objetoTipoObjeto
        ON  objetoTipoObjeto.objId
          = objeto.objId
      INNER JOIN [ti].[objetosTipos] objetoTipo
        ON  objetoTipo.objTipId
          = objetoTipoObjeto.objTipId
      INNER JOIN [ti].[objetosBases] objetoBase
        ON  objetoBase.objId
          = objeto.objId
      INNER JOIN [ti].[bases] base
        ON  base.basId
          = objetoBase.basId
      INNER JOIN [ti].[basesBancos] baseBanco
        ON  baseBanco.basId
          = base.basId
      INNER JOIN [ti].[bancos] banco
        ON  banco.banId
          = baseBanco.banId
      WHERE sistema.nome      = @sistemaNome
      AND   programa.nome     = @programaNome
      AND   funcao.nome       = @funcaoNome
      AND   banco.nome        = @bancoNome
      AND   base.nome         = @baseNome
      AND   objetoTipo.codigo = @objetoTipoCodigo
      AND   objeto.nome       = @objetoNome
      AND   coluna.nome       = @colunaNome
  )
    SET @RecordExists = 1
  RETURN @RecordExists
END
GO

