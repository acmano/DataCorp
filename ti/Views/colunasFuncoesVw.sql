create or alter view ti.colunasFuncoesVw
(
  sistemaId
, linnguagemId
, programaId
, funcaoId
, sistemaNome
, sistemaDescricao
, linguagemNome
, linguagemDescricao
, programaNome
, programaDescricao
, funcaoNome
, funcaoDescricao
, bancoNome
, bancoDescricao
, baseNome
, baseDescricao
, objetoTipoCodigo
, objetoTipoDescricao
, objetoNome
, objetoDescricao
, colunaNome
, colunaDescricao
, grava
, le
, atualiza
, exclui
)
AS
select  sistema.sisId
      , linguagem.linId
      , programa.proId
      , funcao.funId
      , sistema.nome
      , sistema.descricao
      , linguagem.nome
      , linguagem.descricao
      , programa.nome
      , programa.descricao
      , funcao.nome
      , funcao.descricao
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
      , colunaFuncao.grava
      , colunaFuncao.le
      , colunaFuncao.atualiza
      , colunaFuncao.exclui
  from         ti.sistemas sistema
  inner join   ti.programasSistemas programaSistema
    on  programaSistema.sisId
      = sistema.sisId
  inner join   ti.programas programa
    on  programa.proId
      = programaSistema.proId
  inner join   ti.linguagensProgramas linguagemPrograma
    on  linguagemPrograma.proId
      = programa.proId
  inner join   ti.linguagens linguagem
    on  linguagem.linId
      = linguagemPrograma.linId
  inner join   ti.funcoesProgramas funcaoPrograma
    on  funcaoPrograma.proId
      = programa.proId
  inner join   ti.funcoes funcao
    on  funcao.funId
      = funcaoPrograma.funId
  inner join   ti.colunasFuncoes colunaFuncao
    on  colunaFuncao.funProId
      = funcaoPrograma.funProId
  left  outer join 
  (
               ti.bancos banco
    inner join ti.basesBancos basebanco
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
  )
    on  colunaObjeto.colObjId
      = colunaFuncao.colObjId