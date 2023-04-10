IF OBJECT_ID('[cepLogEndFkCepLog]') IS NOT NULL
ALTER TABLE [cepLogradouroEnderecos]
DROP CONSTRAINT [cepLogEndFkCepLog]
go

IF OBJECT_ID('[endFkCepEnd]') IS NOT NULL
ALTER TABLE [cepLogradouroEnderecos]
DROP CONSTRAINT [endFkCepEnd]
go

IF OBJECT_ID('[cepFkSubSetDiv]') IS NOT NULL
ALTER TABLE [ceps]
DROP CONSTRAINT [cepFkSubSetDiv]
go

IF OBJECT_ID('[cepFkSuf]') IS NOT NULL
ALTER TABLE [ceps]
DROP CONSTRAINT [cepFkSuf]
go

IF OBJECT_ID('[cepFkCepDis]') IS NOT NULL
ALTER TABLE [cepsDistritos]
DROP CONSTRAINT [cepFkCepDis]
go

IF OBJECT_ID('[disFkCepDis]') IS NOT NULL
ALTER TABLE [cepsDistritos]
DROP CONSTRAINT [disFkCepDis]
go

IF OBJECT_ID('[cepFkCepLog]') IS NOT NULL
ALTER TABLE [cepsLogradouros]
DROP CONSTRAINT [cepFkCepLog]
go

IF OBJECT_ID('[cepLogFkLogTipLog]') IS NOT NULL
ALTER TABLE [cepsLogradouros]
DROP CONSTRAINT [cepLogFkLogTipLog]
go

IF OBJECT_ID('[cepFkCepMun]') IS NOT NULL
ALTER TABLE [cepsMunicipios]
DROP CONSTRAINT [cepFkCepMun]
go

IF OBJECT_ID('[munFkCepMun]') IS NOT NULL
ALTER TABLE [cepsMunicipios]
DROP CONSTRAINT [munFkCepMun]
go

IF OBJECT_ID('[cepFkCepSubDis]') IS NOT NULL
ALTER TABLE [cepsSubDistritos]
DROP CONSTRAINT [cepFkCepSubDis]
go

IF OBJECT_ID('[subDisFkCepDis]') IS NOT NULL
ALTER TABLE [cepsSubDistritos]
DROP CONSTRAINT [subDisFkCepDis]
go

IF OBJECT_ID('[ctnFkCtnMun]') IS NOT NULL
ALTER TABLE [continentesMundos]
DROP CONSTRAINT [ctnFkCtnMun]
go

IF OBJECT_ID('[munFkCtnMun]') IS NOT NULL
ALTER TABLE [continentesMundos]
DROP CONSTRAINT [munFkCtnMun]
go

IF OBJECT_ID('[disFkDisMun]') IS NOT NULL
ALTER TABLE [distritosMunicipio]
DROP CONSTRAINT [disFkDisMun]
go

IF OBJECT_ID('[munFkDisMun]') IS NOT NULL
ALTER TABLE [distritosMunicipio]
DROP CONSTRAINT [munFkDisMun]
go

IF OBJECT_ID('[endFkEndTipEnd]') IS NOT NULL
ALTER TABLE [enderecosTiposEnderecos]
DROP CONSTRAINT [endFkEndTipEnd]
go

IF OBJECT_ID('[endTipEndFkEndTip]') IS NOT NULL
ALTER TABLE [enderecosTiposEnderecos]
DROP CONSTRAINT [endTipEndFkEndTip]
go

IF OBJECT_ID('[logTipLogFkLog]') IS NOT NULL
ALTER TABLE [logradouroTipoLogradouro]
DROP CONSTRAINT [logTipLogFkLog]
go

IF OBJECT_ID('[logTipLogFkLogTip]') IS NOT NULL
ALTER TABLE [logradouroTipoLogradouro]
DROP CONSTRAINT [logTipLogFkLogTip]
go

IF OBJECT_ID('[mesRegFkMesRegUniFed]') IS NOT NULL
ALTER TABLE [mesoRegioesUnidadeFederacao]
DROP CONSTRAINT [mesRegFkMesRegUniFed]
go

IF OBJECT_ID('[uniFedFkMesRegUniFed]') IS NOT NULL
ALTER TABLE [mesoRegioesUnidadeFederacao]
DROP CONSTRAINT [uniFedFkMesRegUniFed]
go

IF OBJECT_ID('[mesRegFkMicRegMesReg]') IS NOT NULL
ALTER TABLE [microRegioesMesoRegiao]
DROP CONSTRAINT [mesRegFkMicRegMesReg]
go

IF OBJECT_ID('[micRegFkMicRegMesReg]') IS NOT NULL
ALTER TABLE [microRegioesMesoRegiao]
DROP CONSTRAINT [micRegFkMicRegMesReg]
go

IF OBJECT_ID('[micRegFkMunMicReg]') IS NOT NULL
ALTER TABLE [municipiosMicroRegiao]
DROP CONSTRAINT [micRegFkMunMicReg]
go

IF OBJECT_ID('[munFkMunMicReg]') IS NOT NULL
ALTER TABLE [municipiosMicroRegiao]
DROP CONSTRAINT [munFkMunMicReg]
go

IF OBJECT_ID('[munFkMunRegIme]') IS NOT NULL
ALTER TABLE [municipiosRegiaoImediata]
DROP CONSTRAINT [munFkMunRegIme]
go

IF OBJECT_ID('[regImeFkMunRegIme]') IS NOT NULL
ALTER TABLE [municipiosRegiaoImediata]
DROP CONSTRAINT [regImeFkMunRegIme]
go

IF OBJECT_ID('[ctnFkNacCtn]') IS NOT NULL
ALTER TABLE [nacoesContinentes]
DROP CONSTRAINT [ctnFkNacCtn]
go

IF OBJECT_ID('[nacFkNacCtn]') IS NOT NULL
ALTER TABLE [nacoesContinentes]
DROP CONSTRAINT [nacFkNacCtn]
go

IF OBJECT_ID('[munFkNacMun]') IS NOT NULL
ALTER TABLE [nacoesMundos]
DROP CONSTRAINT [munFkNacMun]
go

IF OBJECT_ID('[nacFkEntMun]') IS NOT NULL
ALTER TABLE [nacoesMundos]
DROP CONSTRAINT [nacFkEntMun]
go

IF OBJECT_ID('[nacFkEntPai]') IS NOT NULL
ALTER TABLE [nacoesPaises]
DROP CONSTRAINT [nacFkEntPai]
go

IF OBJECT_ID('[paiFkNacPai]') IS NOT NULL
ALTER TABLE [nacoesPaises]
DROP CONSTRAINT [paiFkNacPai]
go

IF OBJECT_ID('[nacFkEntReg]') IS NOT NULL
ALTER TABLE [nacoesRegioes]
DROP CONSTRAINT [nacFkEntReg]
go

IF OBJECT_ID('[regFkNacReg]') IS NOT NULL
ALTER TABLE [nacoesRegioes]
DROP CONSTRAINT [regFkNacReg]
go

IF OBJECT_ID('[nacFkNacSubReg]') IS NOT NULL
ALTER TABLE [nacoesSubRegioes]
DROP CONSTRAINT [nacFkNacSubReg]
go

IF OBJECT_ID('[subRegFkNacSubReg]') IS NOT NULL
ALTER TABLE [nacoesSubRegioes]
DROP CONSTRAINT [subRegFkNacSubReg]
go

IF OBJECT_ID('[paiFkPaiReg]') IS NOT NULL
ALTER TABLE [paisesRegioes]
DROP CONSTRAINT [paiFkPaiReg]
go

IF OBJECT_ID('[regFkPaiReg]') IS NOT NULL
ALTER TABLE [paisesRegioes]
DROP CONSTRAINT [regFkPaiReg]
go

IF OBJECT_ID('[paiFkPaiSubReg]') IS NOT NULL
ALTER TABLE [paisesSubRegioes]
DROP CONSTRAINT [paiFkPaiSubReg]
go

IF OBJECT_ID('[subRegFkPaiSubReg]') IS NOT NULL
ALTER TABLE [paisesSubRegioes]
DROP CONSTRAINT [subRegFkPaiSubReg]
go

IF OBJECT_ID('[ctnFkRegCtn]') IS NOT NULL
ALTER TABLE [regioesContinentes]
DROP CONSTRAINT [ctnFkRegCtn]
go

IF OBJECT_ID('[regFkRegCtn]') IS NOT NULL
ALTER TABLE [regioesContinentes]
DROP CONSTRAINT [regFkRegCtn]
go

IF OBJECT_ID('[regIntFkRegImeRegInt]') IS NOT NULL
ALTER TABLE [regioesImediatasRegiaoIntermediaria]
DROP CONSTRAINT [regIntFkRegImeRegInt]
go

IF OBJECT_ID('[regIntFkRegImeRegInt]') IS NOT NULL
ALTER TABLE [regioesImediatasRegiaoIntermediaria]
DROP CONSTRAINT [regIntFkRegImeRegInt]
go

IF OBJECT_ID('[regIntFkRegIntUniFed]') IS NOT NULL
ALTER TABLE [regioesIntermediariasUnidadeFederacao]
DROP CONSTRAINT [regIntFkRegIntUniFed]
go

IF OBJECT_ID('[uniFedFkRegIntUniFed]') IS NOT NULL
ALTER TABLE [regioesIntermediariasUnidadeFederacao]
DROP CONSTRAINT [uniFedFkRegIntUniFed]
go

IF OBJECT_ID('[regNacFkNac]') IS NOT NULL
ALTER TABLE [regioesNacoes]
DROP CONSTRAINT [regNacFkNac]
go

IF OBJECT_ID('[regNacFkReg]') IS NOT NULL
ALTER TABLE [regioesNacoes]
DROP CONSTRAINT [regNacFkReg]
go

IF OBJECT_ID('[subRegRegFkSubReg]') IS NOT NULL
ALTER TABLE [regioesSubRegioes]
DROP CONSTRAINT [subRegRegFkSubReg]
go

IF OBJECT_ID('[sugRegRegFkReg]') IS NOT NULL
ALTER TABLE [regioesSubRegioes]
DROP CONSTRAINT [sugRegRegFkReg]
go

IF OBJECT_ID('[setSubRegFkSet]') IS NOT NULL
ALTER TABLE [setoresSubRegioes]
DROP CONSTRAINT [setSubRegFkSet]
go

IF OBJECT_ID('[setSubRegFkSubReg]') IS NOT NULL
ALTER TABLE [setoresSubRegioes]
DROP CONSTRAINT [setSubRegFkSubReg]
go

IF OBJECT_ID('[subSetSetFkSet]') IS NOT NULL
ALTER TABLE [setoresSubSetores]
DROP CONSTRAINT [subSetSetFkSet]
go

IF OBJECT_ID('[subSetSetFkSubSet]') IS NOT NULL
ALTER TABLE [setoresSubSetores]
DROP CONSTRAINT [subSetSetFkSubSet]
go

IF OBJECT_ID('[disFkSubDisDis]') IS NOT NULL
ALTER TABLE [subDistritosDistrito]
DROP CONSTRAINT [disFkSubDisDis]
go

IF OBJECT_ID('[subDisFkSubDisDis]') IS NOT NULL
ALTER TABLE [subDistritosDistrito]
DROP CONSTRAINT [subDisFkSubDisDis]
go

IF OBJECT_ID('[munFkSubDisMun]') IS NOT NULL
ALTER TABLE [subDistritosMunicipio]
DROP CONSTRAINT [munFkSubDisMun]
go

IF OBJECT_ID('[subDisFkSubDisMun]') IS NOT NULL
ALTER TABLE [subDistritosMunicipio]
DROP CONSTRAINT [subDisFkSubDisMun]
go

IF OBJECT_ID('[regFkSubRegReg]') IS NOT NULL
ALTER TABLE [subRegioesRegioes]
DROP CONSTRAINT [regFkSubRegReg]
go

IF OBJECT_ID('[subRegFkSubRegReg]') IS NOT NULL
ALTER TABLE [subRegioesRegioes]
DROP CONSTRAINT [subRegFkSubRegReg]
go

IF OBJECT_ID('[subSetDivSubSetFkSubSet]') IS NOT NULL
ALTER TABLE [subSetorDivisoesSubSetores]
DROP CONSTRAINT [subSetDivSubSetFkSubSet]
go

IF OBJECT_ID('[subSetDivSubSetFkSubSetDiv]') IS NOT NULL
ALTER TABLE [subSetorDivisoesSubSetores]
DROP CONSTRAINT [subSetDivSubSetFkSubSetDiv]
go

IF OBJECT_ID('[sufTipSufFkSuf]') IS NOT NULL
ALTER TABLE [sufixosTiposSufixos]
DROP CONSTRAINT [sufTipSufFkSuf]
go

IF OBJECT_ID('[sufTipSufFkSufTip]') IS NOT NULL
ALTER TABLE [sufixosTiposSufixos]
DROP CONSTRAINT [sufTipSufFkSufTip]
go

IF OBJECT_ID('[regFkUniFedReg]') IS NOT NULL
ALTER TABLE [unidadesFederacaoRegiao]
DROP CONSTRAINT [regFkUniFedReg]
go

IF OBJECT_ID('[uniFedFkUniFedReg]') IS NOT NULL
ALTER TABLE [unidadesFederacaoRegiao]
DROP CONSTRAINT [uniFedFkUniFedReg]
go

