USE DataCorp 
GO


CREATE OR ALTER FUNCTION [ti].[objetoBaseExiste]
(
  @bancoNome        VARCHAR(64)       -- AK da tabela
, @baseNome         VARCHAR(64)       -- AK da tabela
, @objetoTipoCodigo CHAR(2)           -- AK da tabela
, @objetoNome       VARCHAR(256)      -- AK da tabela
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
    WHERE banco.nome        = @bancoNome
    AND   base.nome         = @baseNome
    AND   objetoTipo.codigo = @objetoTipoCodigo
    AND   objeto.nome       = @objetoNome
  )
  IF @@ROWCOUNT = 0
  BEGIN
    SET @RecordExists = -1 -- ou qualquer outra constante significativa
  END
  RETURN @RecordExists
END
GO

