create or alter view ti.programasVw
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
  from  ti.sistemas sistema
  inner join ti.programasSistemas programaSistema
    on  programaSistema.sisId
      = sistema.sisId
  inner join ti.programas programa
    on  programa.proId
      = programaSistema.proId
  inner join ti.linguagensProgramas linguagemPrograma
    on  linguagemPrograma.proId
      = programa.proId
  inner join ti.linguagens linguagem
    on  linguagem.linId
      = linguagemPrograma.linId
  inner join ti.funcoesProgramas funcaoPrograma
    on  funcaoPrograma.proId
      = programa.proId
  inner join ti.funcoes funcao
    on  funcao.funId
      = funcaoPrograma.funId