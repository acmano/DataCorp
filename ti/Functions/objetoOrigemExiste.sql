USE DataCorp 
GO


CREATE OR ALTER FUNCTION [ti].[objetoOrigemExiste]
(
  @bancoNome              VARCHAR(64)  -- AK da tabela
, @baseNome               VARCHAR(64)  -- AK da tabela
, @objetoTipoCodigo       CHAR(2)      -- AK da tabela
, @objetoNome             VARCHAR(256) -- AK da tabela
, @origemBancoNome        VARCHAR(64)  -- AK da tabela
, @origemBaseNome         VARCHAR(64)  -- AK da tabela
, @origemObjetoTipoCodigo CHAR(2)      -- AK da tabela
, @origemObjetoNome       VARCHAR(256) -- AK da tabela
)
RETURNS BIT
AS
BEGIN
  DECLARE @RecordExists BIT = 0
  IF EXISTS
  (
    SELECT  DISTINCT 1
      FROM  [ti].[bancos] banco
      INNER JOIN [ti].[basesBancos] baseBanco
        ON  baseBanco.banId
          = banco.banId
      INNER JOIN [ti].[bases] base
        ON  base.basId
          = baseBanco.basId
      INNER JOIN [ti].[objetosBases] objetoBase 
        ON  objetoBase.basId
        = base.basId
      INNER JOIN [ti].[objetos] objeto
        ON  objeto.objId
          = objetoBase.objId
      INNER JOIN [ti].[objetosTiposObjetos] objetoTipoObjeto
        ON  objetoTipoObjeto.objId
          = objeto.objId
      INNER JOIN [ti].[objetosTipos] objetoTipo
        ON  objetoTipo.objTipId
          = objetoTipoObjeto.objTipId
      INNER JOIN [ti].[objetosOrigens] objetoOrigem
        ON  objetoOrigem.objBasId
          = objetoBase.objBasId
      INNER JOIN [ti].[objetosBases] origemObjetoBase
        ON  origemObjetoBase.objBasId
          = objetoOrigem.objBasOriId
      INNER JOIN [ti].[objetos] origemObjeto
        ON  origemObjeto.objId
          = origemObjetoBase.objId
      INNER JOIN [ti].[objetosTiposObjetos] origemObjetoTipoObjeto
        ON  origemObjetoTipoObjeto.objId
         =  origemObjeto.objId
      INNER JOIN [ti].[objetosTipos] origemObjetoTipo
        ON  origemObjetoTipo.objTipId
          = origemObjetoTipoObjeto.objTipId
      INNER JOIN [ti].[bases] origemBase
        ON  origemBase.basId
          = origemObjetoBase.basId
      INNER JOIN [ti].[basesBancos] origemBaseBanco
        ON  origemBaseBanco.basId
          = origemBase.basId
      INNER JOIN [ti].[bancos] origemBanco
        ON  origemBanco.banId
          = origemBaseBanco.banId
      WHERE banco.nome              = @bancoNome
      AND   base.nome               = @baseNome
      AND   objetoTipo.codigo       = @objetoTipoCodigo
      AND   objeto.nome             = @objetoNome
      AND   origemBanco.nome        = @origemBancoNome
      AND   origemBase.nome         = @origemBaseNome
      AND   origemObjetoTipo.codigo = @origemObjetoTipoCodigo
      AND   origemObjeto.nome       = @origemObjetoNome
  )
  IF @@ROWCOUNT = 0
  BEGIN
    SET @RecordExists = -1 -- ou qualquer outra constante significativa
  END
  RETURN @RecordExists
END
GO
