create or alter view ti.objetosVw
(
  bancoId
, baseId
, objetoTipoId
, objetoId
, colunaId
, bancoNome
, bancoDescricao
, baseNome
, baseDescricao
, tipoCodigo
, tipoDescricao
, objetoNome
, objetoDescricao
, colunaNome
, colunaDescricao
)
AS
select  banco.banId
      , base.basId
      , objetoTipo.objTipId
      , objeto.objId
      , coluna.colId
      , banco.nome
      , banco.descricao
      , base.nome
      , base.descricao
      , objetoTipo.codigo
      , objetoTipo.descricao
      , objeto.nome
      , objeto.descricao
      , coluna.nome
      , coluna.descricao
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
  inner join ti.colunasObjetos colunaObjeto
    on  colunaObjeto.objId
      = objeto.objId
  inner join ti.colunas coluna
    on  coluna.colId
      = colunaObjeto.colId
