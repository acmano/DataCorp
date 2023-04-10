create or alter view ti.objetosOrigensVw
(
  bancoId
, baseId
, objetoTipoId
, objetoId
, origemBancoId
, origemBaseId
, origemObjetoTipoObjetoId
, origemObjetoId
, bancoNome
, bancoDescricao
, baseNome
, baseDescricao
, objetoTipoCodigo
, objetoTipoDescricao
, objetoNome
, objetoDescricao
, origemBancoNome
, origemBancoDescricao
, origemBaseNome
, origemBaseDescricao
, origemObjetoTipoCodigo
, origemObjetoTipoDescricao
, origemObjetoNome
, origemObjetoDescricao
)
AS
select  banco.banId
      , base.basId
      , objetoTipo.objTipId
      , objeto.objId
      , origemBanco.banId
      , origemBase.basId
      , origemObjetoTipoObjeto.objTipId
      , origemObjeto.objId
      , banco.nome
      , banco.descricao
      , base.nome
      , base.descricao
      , objetoTipo.codigo
      , objetoTipo.descricao
      , objeto.nome
      , objeto.descricao
      , origemBanco.nome
      , origemBanco.descricao
      , origemBase.nome
      , origemBase.descricao
      , origemObjetoTipo.codigo
      , origemObjetoTipo.descricao
      , origemObjeto.nome
      , origemObjeto.descricao
  from  ti.bancos banco
  inner join ti.basesBancos baseBanco
    on  baseBanco.banId
      = banco.banId
  inner join ti.bases base
    on  base.basId
      = baseBanco.basId
  inner join ti.objetosBases objetoBase
    on  objetoBase.basId
      = base.basId
  inner join ti.objetos objeto
    on  objeto.objId
      = objetoBase.objId
  inner join ti.objetosTiposObjetos objetoTipoObjeto
    on  objetoTipoObjeto.objId
      = objeto.objId
  inner join ti.objetosTipos objetoTipo
    on  objetoTipo.objTipId
      = objetoTipoObjeto.objTipId
  inner join ti.objetosOrigens objetoOrigem
    on  objetoOrigem.objBasId
      = objetoBase.objBasId
  inner join ti.objetosBases origemObjetoBase
    on  origemObjetoBase.objBasId
      = objetoOrigem.objBasOriId
  inner join ti.objetos origemObjeto
    on  origemObjeto.objId
      = origemObjetoBase.objId
  inner join ti.objetosTiposObjetos origemObjetoTipoObjeto
    on  origemObjetoTipoObjeto.objId
      = origemObjeto.objId
  inner join ti.objetosTipos origemObjetoTipo
    on  origemObjetoTipo.objTipId
      = origemObjetoTipoObjeto.objTipId
  inner join ti.bases origemBase
    on  origemBase.basId
      = origemObjetoBase.basId
  inner join ti.basesBancos origemBaseBanco
    on  origemBaseBanco.basId
      = origemBase.basId
  inner join ti.bancos origemBanco
    on  origemBanco.banId
      = origemBaseBanco.banId

