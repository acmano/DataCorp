USE DataCorp
GO


EXEC [ti].[bancoUpsert] N'Informix', N'Banco de dados Informix, da IBM' 
EXEC [ti].[bancoUpsert] N'SQL Server', N'Banco de dados SQL Server, da Microsoft' 


EXEC [ti].[baseUpsert] N'Informix', N'ceramica', N'Base ceramica, específica do sistema SILoS' 
EXEC [ti].[baseUpsert] N'Informix', N'dbloren', N'Base dbloren, tabelas Lorenzetti, principalmente para o sistema Comercial' 
EXEC [ti].[baseUpsert] N'Informix', N'easy', N'Base easy, para tabelas de integração como sistema de importação Narwal' 
EXEC [ti].[baseUpsert] N'Informix', N'gecex', N'Base gecex, ipróprio para o sistema de importação e SISCOMEX' 
EXEC [ti].[baseUpsert] N'Informix', N'h_logix', N'Base h_logix, reservada para tabelas históricas e de log' 
EXEC [ti].[baseUpsert] N'Informix', N'logix', N'Base logix, do ERP Logix, da Totvs' 
EXEC [ti].[baseUpsert] N'Informix', N'rhsnf', N'Base rhsnf, para tabelas de interface entre o sistema de vendas da ADCL e a SNF' 
EXEC [ti].[baseUpsert] N'Informix', N'sped', N'Base sped, para sistemas de SPED Fiscal, da Totvs' 


EXEC [ti].[objetoTipoUpsert] N'T', N'Tabela' 
EXEC [ti].[objetoTipoUpsert] N'V', N'View' 
EXEC [ti].[objetoTipoUpsert] N'F', N'Função' 
EXEC [ti].[objetoTipoUpsert] N'P', N'Procedure' 


EXEC [ti].[linguagemUpsert] N'4GL', N'Informix 4GL' 
EXEC [ti].[linguagemUpsert] N'TTC', N'Totvs Tec 4GL' 
EXEC [ti].[linguagemUpsert] N'VB6', N'Microsoft Visual Basic 6.0' 
EXEC [ti].[linguagemUpsert] N'VBN', N'Microsoft Visual Basic .Net' 
EXEC [ti].[linguagemUpsert] N'VC#', N'Microsoft Visual C#' 


EXEC [ti].[objetoUpsert] N'Informix', N'logix', N'T', N'empresa', N'Cadastro de empresas do ERP Logix'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'empresa', N'cod_empresa', N'Código da empresa'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'empresa', N'den_empresa', N'Descrição da empresa'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'empresa', N'den_reduz', N'Descrição reduzida da empresa'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'empresa', N'end_empresa', N'Endereço da Empresa'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'empresa', N'den_bairro', N'Bairro'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'empresa', N'den_munic', N'Nome da cidade'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'empresa', N'uni_feder', N'Estado'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'empresa', N'ins_estadual', N'Inscrição estadual'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'empresa', N'num_cgc', N'CNPJ'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'empresa', N'num_caixa_postal', N'Caixa postal'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'empresa', N'cod_cep', N'CEP'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'empresa', N'num_telefone', N'Número do Telefone'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'empresa', N'num_telex', N'Número do Telex'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'empresa', N'num_fax', N'Número do Fax'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'empresa', N'end_telegraf', N'Endereço telegráfico'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'empresa', N'num_reg_junta', N'Número de registro na junta comercial'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'empresa', N'dat_inclu_junta', N'Data de inclusão na junta comercial'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'empresa', N'ies_filial', N'É uma filial?'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'empresa', N'dat_fundacao', N'Data de fundação da empresa'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'empresa', N'cod_cliente', N'Código de cliente da empresa'

EXEC [ti].[objetoUpsert] N'Informix', N'logix', N'T', N'local', N'Cadastro de locais do ERP Logix'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'local', N'cod_empresa', N'Código da empresa'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'local', N'cod_local', N'Código do local'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'local', N'den_local', N'Descrição do local'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'local', N'num_nivel', N''

EXEC [ti].[objetoUpsert] N'Informix', N'logix', N'T', N'item', N'Cadastro de itens' ;
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'item', N'cod_empresa', N'código da empresa onde o item pode ser utilizado' ;
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'item', N'cod_item', N'Código do Item'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'item', N'den_item', N'Descrição completa do item'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'item', N'den_item_reduz', N'Descrição reduzida do item'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'item', N'cod_unid_med', N'Código da Unidade de Medida'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'item', N'pes_unit', N'Peso Unitário'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'item', N'ies_tip_item', N'Tipo do item: Comprado, Beneficiado, fanTasma, Produzido ou Final'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'item', N'dat_cadastro', N'Data de cadastro do item'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'item', N'ies_ctr_estoque', N'Indicador de controle de estoque: Sim ou Não'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'item', N'cod_local_estoq', N'Código do local de estoque'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'item', N'ies_tem_inspecao', N'Indicador de inspeção de qualidade: Sim ou Não'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'item', N'cod_local_insp', N'Código do local de inspeção'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'item', N'ies_ctr_lote', N'Indicador de controle de lote: Sim ou Não'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'item', N'cod_familia', N'Código da família'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'item', N'gru_ctr_estoq', N'Código do grupo de controle de estoque'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'item', N'cod_cla_fisc', N'Código da classificação fiscal'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'item', N'pct_ipi', N'Percentual de IPI'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'item', N'cod_lin_prod', N'Código da linha de produto (Unidade de negócios)'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'item', N'cod_lin_recei', N'Código da linha de receita (Linha de produto)'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'item', N'cod_seg_merc', N'Código do segmento de mercado (Família de produto)'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'item', N'cod_cla_uso', N'Código da classe de uso (Produto chave)'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'item', N'fat_conver', N'Fator de conversão'
EXEC [ti].[colunaUpsert] N'Informix', N'logix', N'T', N'item', N'ies_situacao', N'Indicador de situação do item: Ativo, Inativo ou Cancelado'

EXEC [ti].[objetoUpsert] N'Informix', N'ceramica', N'T', N'lor_lousan_empresa_ceramica', N'Empresas liberadas para trabalhar com sistema SILoS', N'Informix', N'logix', N'T', N'empresa'
EXEC [ti].[colunaUpsert] N'Informix', N'ceramica', N'T', N'lor_lousan_empresa_ceramica', N'num_serie_llsec', N'ID da empresa'
EXEC [ti].[colunaUpsert] N'Informix', N'ceramica', N'T', N'lor_lousan_empresa_ceramica', N'cod_empresa', N'Código da Empresa'

EXEC [ti].[objetoUpsert] N'Informix', N'ceramica', N'T', N'lor_lousan_local', N'Locais de estoque próprios do sistema SILoS', N'Informix', N'logix', N'T', N'local'
EXEC [ti].[colunaUpsert] N'Informix', N'ceramica', N'T', N'lor_lousan_local', N'num_serie_llslc', N'ID do local'
EXEC [ti].[colunaUpsert] N'Informix', N'ceramica', N'T', N'lor_lousan_local', N'num_serie_llsec', N'ID da empresa do local'
EXEC [ti].[colunaUpsert] N'Informix', N'ceramica', N'T', N'lor_lousan_local', N'cod_local', N'Código do local'
EXEC [ti].[colunaUpsert] N'Informix', N'ceramica', N'T', N'lor_lousan_local', N'den_local', N'Descrição do local'

EXEC [ti].[objetoUpsert] N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'Itens específicos do processo cerâmico', N'Informix', N'logix', N'T', N'item'
EXEC [ti].[colunaUpsert] N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'num_serie_llsi', N'ID do item'
EXEC [ti].[colunaUpsert] N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'num_serie_llsec', N'ID da empresa do item'
EXEC [ti].[colunaUpsert] N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'num_serie_llslc', N'ID do local de estoque do item'
EXEC [ti].[colunaUpsert] N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'cod_item', N'Código do item'
EXEC [ti].[colunaUpsert] N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'den_item', N'Descrição do item'
EXEC [ti].[colunaUpsert] N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'ies_tip_item', N'Tipo do item'
EXEC [ti].[colunaUpsert] N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'pes_unit', N'Peso unitário do item'
EXEC [ti].[colunaUpsert] N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'qtd_minutos_maturacao', N'Tempo em minutos necessário para maturação do item após a fundição'


EXEC [ti].[sistemaUpsert] N'SILoS', N'Sistema Industrial de Louças Sanitárias' 
EXEC [ti].[programaUpsert] N'SILoS', N'4GL', N'LOR0583', N'Cadastro de Itens' 

EXEC [ti].[funcaoUpsert]       N'SILoS', N'4GL', N'LOR0583', N'Main', N'Ponto de início do programa'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'Main', N'Informix', N'logix', N'T', N'empresa', N'cod_empresa', N'N', N'S', N'N', N'N'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'Main', N'Informix', N'logix', N'T', N'empresa', N'den_empresa', N'N', N'S', N'N', N'N'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'Main', N'Informix', N'ceramica', N'T', N'lor_lousan_empresa_ceramica', N'num_serie_llsec', N'N', N'S', N'N', N'N'

EXEC [ti].[funcaoUpsert]       N'SILoS', N'4GL', N'LOR0583', N'lor0583_local', N'Obtém dados do local'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_local', N'Informix', N'ceramica', N'T', N'lor_lousan_local', N'num_serie_llslc', N'N', N'S', N'N', N'N'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_local', N'Informix', N'ceramica', N'T', N'lor_lousan_local', N'num_serie_llsec', N'N', N'S', N'N', N'N'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_local', N'Informix', N'ceramica', N'T', N'lor_lousan_local', N'cod_local', N'N', N'S', N'N', N'N'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_local', N'Informix', N'ceramica', N'T', N'lor_lousan_local', N'den_local', N'N', N'S', N'N', N'N'

EXEC [ti].[funcaoUpsert]       N'SILoS', N'4GL', N'LOR0583', N'lor0583_co', N'Consulta um registro da tabela lor_lousan_item'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_co', N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'num_serie_llsi', N'N', N'S', N'N', N'N'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_co', N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'num_serie_llsec', N'N', N'S', N'N', N'N'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_co', N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'num_serie_llslc', N'N', N'S', N'N', N'N'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_co', N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'cod_item', N'N', N'S', N'N', N'N'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_co', N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'den_item', N'N', N'S', N'N', N'N'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_co', N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'ies_tip_item', N'N', N'S', N'N', N'N'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_co', N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'pes_unit', N'N', N'S', N'N', N'N'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_co', N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'qtd_minutos_maturacao', N'N', N'S', N'N', N'N'

EXEC [ti].[funcaoUpsert]       N'SILoS', N'4GL', N'LOR0583', N'lor0583_pg', N'Realiza paginacao na consulta da tabela lor_lousan_item'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_pg', N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'num_serie_llsi', N'N', N'S', N'N', N'N'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_pg', N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'num_serie_llsec', N'N', N'S', N'N', N'N'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_pg', N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'num_serie_llslc', N'N', N'S', N'N', N'N'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_pg', N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'cod_item', N'N', N'S', N'N', N'N'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_pg', N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'den_item', N'N', N'S', N'N', N'N'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_pg', N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'ies_tip_item', N'N', N'S', N'N', N'N'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_pg', N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'pes_unit', N'N', N'S', N'N', N'N'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_pg', N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'qtd_minutos_maturacao', N'N', N'S', N'N', N'N'

EXEC [ti].[funcaoUpsert]       N'SILoS', N'4GL', N'LOR0583', N'lor0583_li', N'Emite o relatorio cadastral da tabela lor_lousan_item'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_li', N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'num_serie_llsi', N'N', N'S', N'N', N'N'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_li', N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'num_serie_llsec', N'N', N'S', N'N', N'N'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_li', N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'num_serie_llslc', N'N', N'S', N'N', N'N'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_li', N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'cod_item', N'N', N'S', N'N', N'N'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_li', N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'den_item', N'N', N'S', N'N', N'N'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_li', N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'ies_tip_item', N'N', N'S', N'N', N'N'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_li', N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'pes_unit', N'N', N'S', N'N', N'N'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_li', N'Informix', N'ceramica', N'T', N'lor_lousan_item', N'qtd_minutos_maturacao', N'N', N'S', N'N', N'N'

EXEC [ti].[funcaoUpsert]       N'SILoS', N'4GL', N'LOR0583', N'lor0583_re', N'Lay-out do relatorio cadastral da tabela lor_lousan_item'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_re', N'Informix', N'ceramica', N'T', N'lor_lousan_local', N'num_serie_llslc', N'N', N'S', N'N', N'N'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_re', N'Informix', N'ceramica', N'T', N'lor_lousan_local', N'cod_local', N'N', N'S', N'N', N'N'
EXEC [ti].[colunaFuncaoUpsert] N'SILoS', N'4GL', N'LOR0583', N'lor0583_re', N'Informix', N'ceramica', N'T', N'lor_lousan_local', N'den_local', N'N', N'S', N'N', N'N'


select * from ti.bancos
select * from ti.bases
select * from ti.basesBancos
select * from ti.objetosTipos
select * from ti.objetos
select * from ti.objetosTiposObjetos
select * from ti.objetosBases
select * from ti.colunas
select * from ti.colunasObjetos


select * from ti.sistemas
select * from ti.programas
select * from ti.funcoes