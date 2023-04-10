IF OBJECT_ID('[cep].[cepLogEndFkCepLog]') IS NOT NULL
ALTER TABLE [cep].[cepLogradouroEnderecos]
DROP CONSTRAINT [cepLogEndFkCepLog]
go

IF OBJECT_ID('[cep].[endFkCepEnd]') IS NOT NULL
ALTER TABLE [cep].[cepLogradouroEnderecos]
DROP CONSTRAINT [endFkCepEnd]
go

IF OBJECT_ID('[cep].[cepFkSubSetDiv]') IS NOT NULL
ALTER TABLE [cep].[ceps]
DROP CONSTRAINT [cepFkSubSetDiv]
go

IF OBJECT_ID('[cep].[cepFkSuf]') IS NOT NULL
ALTER TABLE [cep].[ceps]
DROP CONSTRAINT [cepFkSuf]
go

IF OBJECT_ID('[cep].[cepFkCepDis]') IS NOT NULL
ALTER TABLE [cep].[cepsDistritos]
DROP CONSTRAINT [cepFkCepDis]
go

IF OBJECT_ID('[cep].[disFkCepDis]') IS NOT NULL
ALTER TABLE [cep].[cepsDistritos]
DROP CONSTRAINT [disFkCepDis]
go

IF OBJECT_ID('[cep].[cepFkCepLog]') IS NOT NULL
ALTER TABLE [cep].[cepsLogradouros]
DROP CONSTRAINT [cepFkCepLog]
go

IF OBJECT_ID('[cep].[cepLogFkLogTipLog]') IS NOT NULL
ALTER TABLE [cep].[cepsLogradouros]
DROP CONSTRAINT [cepLogFkLogTipLog]
go

IF OBJECT_ID('[cep].[cepFkCepMun]') IS NOT NULL
ALTER TABLE [cep].[cepsMunicipios]
DROP CONSTRAINT [cepFkCepMun]
go

IF OBJECT_ID('[cep].[munFkCepMun]') IS NOT NULL
ALTER TABLE [cep].[cepsMunicipios]
DROP CONSTRAINT [munFkCepMun]
go

IF OBJECT_ID('[cep].[cepFkCepSubDis]') IS NOT NULL
ALTER TABLE [cep].[cepsSubDistritos]
DROP CONSTRAINT [cepFkCepSubDis]
go

IF OBJECT_ID('[cep].[subDisFkCepDis]') IS NOT NULL
ALTER TABLE [cep].[cepsSubDistritos]
DROP CONSTRAINT [subDisFkCepDis]
go

IF OBJECT_ID('[cep].[endFkEndTipEnd]') IS NOT NULL
ALTER TABLE [cep].[enderecosTiposEnderecos]
DROP CONSTRAINT [endFkEndTipEnd]
go

IF OBJECT_ID('[cep].[endTipEndFkEndTip]') IS NOT NULL
ALTER TABLE [cep].[enderecosTiposEnderecos]
DROP CONSTRAINT [endTipEndFkEndTip]
go

IF OBJECT_ID('[cep].[logTipLogFkLog]') IS NOT NULL
ALTER TABLE [cep].[logradouroTipoLogradouro]
DROP CONSTRAINT [logTipLogFkLog]
go

IF OBJECT_ID('[cep].[logTipLogFkLogTip]') IS NOT NULL
ALTER TABLE [cep].[logradouroTipoLogradouro]
DROP CONSTRAINT [logTipLogFkLogTip]
go

IF OBJECT_ID('[cep].[subRegRegFkSubReg]') IS NOT NULL
ALTER TABLE [cep].[regioesSubRegioes]
DROP CONSTRAINT [subRegRegFkSubReg]
go

IF OBJECT_ID('[cep].[sugRegRegFkReg]') IS NOT NULL
ALTER TABLE [cep].[regioesSubRegioes]
DROP CONSTRAINT [sugRegRegFkReg]
go

IF OBJECT_ID('[cep].[setSubRegFkSet]') IS NOT NULL
ALTER TABLE [cep].[setoresSubRegioes]
DROP CONSTRAINT [setSubRegFkSet]
go

IF OBJECT_ID('[cep].[setSubRegFkSubReg]') IS NOT NULL
ALTER TABLE [cep].[setoresSubRegioes]
DROP CONSTRAINT [setSubRegFkSubReg]
go

IF OBJECT_ID('[cep].[subSetSetFkSet]') IS NOT NULL
ALTER TABLE [cep].[setoresSubSetores]
DROP CONSTRAINT [subSetSetFkSet]
go

IF OBJECT_ID('[cep].[subSetSetFkSubSet]') IS NOT NULL
ALTER TABLE [cep].[setoresSubSetores]
DROP CONSTRAINT [subSetSetFkSubSet]
go

IF OBJECT_ID('[cep].[subSetDivSubSetFkSubSet]') IS NOT NULL
ALTER TABLE [cep].[subSetorDivisoesSubSetores]
DROP CONSTRAINT [subSetDivSubSetFkSubSet]
go

IF OBJECT_ID('[cep].[subSetDivSubSetFkSubSetDiv]') IS NOT NULL
ALTER TABLE [cep].[subSetorDivisoesSubSetores]
DROP CONSTRAINT [subSetDivSubSetFkSubSetDiv]
go

IF OBJECT_ID('[cep].[sufTipSufFkSuf]') IS NOT NULL
ALTER TABLE [cep].[sufixosTiposSufixos]
DROP CONSTRAINT [sufTipSufFkSuf]
go

IF OBJECT_ID('[cep].[sufTipSufFkSufTip]') IS NOT NULL
ALTER TABLE [cep].[sufixosTiposSufixos]
DROP CONSTRAINT [sufTipSufFkSufTip]
go

IF OBJECT_ID('[geo].[ctnFkCtnMun]') IS NOT NULL
ALTER TABLE [geo].[continentesMundos]
DROP CONSTRAINT [ctnFkCtnMun]
go

IF OBJECT_ID('[geo].[munFkCtnMun]') IS NOT NULL
ALTER TABLE [geo].[continentesMundos]
DROP CONSTRAINT [munFkCtnMun]
go

IF OBJECT_ID('[geo].[ctnFkNacCtn]') IS NOT NULL
ALTER TABLE [geo].[nacoesContinentes]
DROP CONSTRAINT [ctnFkNacCtn]
go

IF OBJECT_ID('[geo].[nacFkNacCtn]') IS NOT NULL
ALTER TABLE [geo].[nacoesContinentes]
DROP CONSTRAINT [nacFkNacCtn]
go

IF OBJECT_ID('[geo].[munFkNacMun]') IS NOT NULL
ALTER TABLE [geo].[nacoesMundos]
DROP CONSTRAINT [munFkNacMun]
go

IF OBJECT_ID('[geo].[nacFkEntMun]') IS NOT NULL
ALTER TABLE [geo].[nacoesMundos]
DROP CONSTRAINT [nacFkEntMun]
go

IF OBJECT_ID('[geo].[nacFkEntPai]') IS NOT NULL
ALTER TABLE [geo].[nacoesPaises]
DROP CONSTRAINT [nacFkEntPai]
go

IF OBJECT_ID('[geo].[paiFkNacPai]') IS NOT NULL
ALTER TABLE [geo].[nacoesPaises]
DROP CONSTRAINT [paiFkNacPai]
go

IF OBJECT_ID('[geo].[nacFkEntReg]') IS NOT NULL
ALTER TABLE [geo].[nacoesRegioes]
DROP CONSTRAINT [nacFkEntReg]
go

IF OBJECT_ID('[geo].[regFkNacReg]') IS NOT NULL
ALTER TABLE [geo].[nacoesRegioes]
DROP CONSTRAINT [regFkNacReg]
go

IF OBJECT_ID('[geo].[nacFkNacSubReg]') IS NOT NULL
ALTER TABLE [geo].[nacoesSubRegioes]
DROP CONSTRAINT [nacFkNacSubReg]
go

IF OBJECT_ID('[geo].[subRegFkNacSubReg]') IS NOT NULL
ALTER TABLE [geo].[nacoesSubRegioes]
DROP CONSTRAINT [subRegFkNacSubReg]
go

IF OBJECT_ID('[geo].[paiFkPaiReg]') IS NOT NULL
ALTER TABLE [geo].[paisesRegioes]
DROP CONSTRAINT [paiFkPaiReg]
go

IF OBJECT_ID('[geo].[regFkPaiReg]') IS NOT NULL
ALTER TABLE [geo].[paisesRegioes]
DROP CONSTRAINT [regFkPaiReg]
go

IF OBJECT_ID('[geo].[paiFkPaiSubReg]') IS NOT NULL
ALTER TABLE [geo].[paisesSubRegioes]
DROP CONSTRAINT [paiFkPaiSubReg]
go

IF OBJECT_ID('[geo].[subRegFkPaiSubReg]') IS NOT NULL
ALTER TABLE [geo].[paisesSubRegioes]
DROP CONSTRAINT [subRegFkPaiSubReg]
go

IF OBJECT_ID('[geo].[ctnFkRegCtn]') IS NOT NULL
ALTER TABLE [geo].[regioesContinentes]
DROP CONSTRAINT [ctnFkRegCtn]
go

IF OBJECT_ID('[geo].[regFkRegCtn]') IS NOT NULL
ALTER TABLE [geo].[regioesContinentes]
DROP CONSTRAINT [regFkRegCtn]
go

IF OBJECT_ID('[geo].[regFkSubRegReg]') IS NOT NULL
ALTER TABLE [geo].[subRegioesRegioes]
DROP CONSTRAINT [regFkSubRegReg]
go

IF OBJECT_ID('[geo].[subRegFkSubRegReg]') IS NOT NULL
ALTER TABLE [geo].[subRegioesRegioes]
DROP CONSTRAINT [subRegFkSubRegReg]
go

IF OBJECT_ID('[ibge].[disFkDisMun]') IS NOT NULL
ALTER TABLE [ibge].[distritosMunicipio]
DROP CONSTRAINT [disFkDisMun]
go

IF OBJECT_ID('[ibge].[munFkDisMun]') IS NOT NULL
ALTER TABLE [ibge].[distritosMunicipio]
DROP CONSTRAINT [munFkDisMun]
go

IF OBJECT_ID('[ibge].[mesRegFkMesRegUniFed]') IS NOT NULL
ALTER TABLE [ibge].[mesoRegioesUnidadeFederacao]
DROP CONSTRAINT [mesRegFkMesRegUniFed]
go

IF OBJECT_ID('[ibge].[uniFedFkMesRegUniFed]') IS NOT NULL
ALTER TABLE [ibge].[mesoRegioesUnidadeFederacao]
DROP CONSTRAINT [uniFedFkMesRegUniFed]
go

IF OBJECT_ID('[ibge].[mesRegFkMicRegMesReg]') IS NOT NULL
ALTER TABLE [ibge].[microRegioesMesoRegiao]
DROP CONSTRAINT [mesRegFkMicRegMesReg]
go

IF OBJECT_ID('[ibge].[micRegFkMicRegMesReg]') IS NOT NULL
ALTER TABLE [ibge].[microRegioesMesoRegiao]
DROP CONSTRAINT [micRegFkMicRegMesReg]
go

IF OBJECT_ID('[ibge].[micRegFkMunMicReg]') IS NOT NULL
ALTER TABLE [ibge].[municipiosMicroRegiao]
DROP CONSTRAINT [micRegFkMunMicReg]
go

IF OBJECT_ID('[ibge].[munFkMunMicReg]') IS NOT NULL
ALTER TABLE [ibge].[municipiosMicroRegiao]
DROP CONSTRAINT [munFkMunMicReg]
go

IF OBJECT_ID('[ibge].[munFkMunRegIme]') IS NOT NULL
ALTER TABLE [ibge].[municipiosRegiaoImediata]
DROP CONSTRAINT [munFkMunRegIme]
go

IF OBJECT_ID('[ibge].[regImeFkMunRegIme]') IS NOT NULL
ALTER TABLE [ibge].[municipiosRegiaoImediata]
DROP CONSTRAINT [regImeFkMunRegIme]
go

IF OBJECT_ID('[ibge].[regIntFkRegImeRegInt]') IS NOT NULL
ALTER TABLE [ibge].[regioesImediatasRegiaoIntermediaria]
DROP CONSTRAINT [regIntFkRegImeRegInt]
go

IF OBJECT_ID('[ibge].[regIntFkRegImeRegInt]') IS NOT NULL
ALTER TABLE [ibge].[regioesImediatasRegiaoIntermediaria]
DROP CONSTRAINT [regIntFkRegImeRegInt]
go

IF OBJECT_ID('[ibge].[regIntFkRegIntUniFed]') IS NOT NULL
ALTER TABLE [ibge].[regioesIntermediariasUnidadeFederacao]
DROP CONSTRAINT [regIntFkRegIntUniFed]
go

IF OBJECT_ID('[ibge].[uniFedFkRegIntUniFed]') IS NOT NULL
ALTER TABLE [ibge].[regioesIntermediariasUnidadeFederacao]
DROP CONSTRAINT [uniFedFkRegIntUniFed]
go

IF OBJECT_ID('[ibge].[regNacFkNac]') IS NOT NULL
ALTER TABLE [ibge].[regioesNacoes]
DROP CONSTRAINT [regNacFkNac]
go

IF OBJECT_ID('[ibge].[regNacFkReg]') IS NOT NULL
ALTER TABLE [ibge].[regioesNacoes]
DROP CONSTRAINT [regNacFkReg]
go

IF OBJECT_ID('[ibge].[disFkSubDisDis]') IS NOT NULL
ALTER TABLE [ibge].[subDistritosDistrito]
DROP CONSTRAINT [disFkSubDisDis]
go

IF OBJECT_ID('[ibge].[subDisFkSubDisDis]') IS NOT NULL
ALTER TABLE [ibge].[subDistritosDistrito]
DROP CONSTRAINT [subDisFkSubDisDis]
go

IF OBJECT_ID('[ibge].[munFkSubDisMun]') IS NOT NULL
ALTER TABLE [ibge].[subDistritosMunicipio]
DROP CONSTRAINT [munFkSubDisMun]
go

IF OBJECT_ID('[ibge].[subDisFkSubDisMun]') IS NOT NULL
ALTER TABLE [ibge].[subDistritosMunicipio]
DROP CONSTRAINT [subDisFkSubDisMun]
go

IF OBJECT_ID('[ibge].[regFkUniFedReg]') IS NOT NULL
ALTER TABLE [ibge].[unidadesFederacaoRegiao]
DROP CONSTRAINT [regFkUniFedReg]
go

IF OBJECT_ID('[ibge].[uniFedFkUniFedReg]') IS NOT NULL
ALTER TABLE [ibge].[unidadesFederacaoRegiao]
DROP CONSTRAINT [uniFedFkUniFedReg]
go

