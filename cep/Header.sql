/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      DataCorp.DM1
 * Author :       Antonio Carlos Mano
 *
 * Date Created : Friday, March 17, 2023 13:19:40
 * Target DBMS : Microsoft SQL Server 2017
 */

USE DataCorp
go
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

IF OBJECT_ID('[cepLogradouroEnderecos]') IS NOT NULL
BEGIN
    DROP TABLE [cepLogradouroEnderecos]
    PRINT '<<< DROPPED TABLE [cepLogradouroEnderecos] >>>'
END
go
IF OBJECT_ID('[ceps]') IS NOT NULL
BEGIN
    DROP TABLE [ceps]
    PRINT '<<< DROPPED TABLE [ceps] >>>'
END
go
IF OBJECT_ID('[cepsDistritos]') IS NOT NULL
BEGIN
    DROP TABLE [cepsDistritos]
    PRINT '<<< DROPPED TABLE [cepsDistritos] >>>'
END
go
IF OBJECT_ID('[cepsLogradouros]') IS NOT NULL
BEGIN
    DROP TABLE [cepsLogradouros]
    PRINT '<<< DROPPED TABLE [cepsLogradouros] >>>'
END
go
IF OBJECT_ID('[cepsMunicipios]') IS NOT NULL
BEGIN
    DROP TABLE [cepsMunicipios]
    PRINT '<<< DROPPED TABLE [cepsMunicipios] >>>'
END
go
IF OBJECT_ID('[cepsSubDistritos]') IS NOT NULL
BEGIN
    DROP TABLE [cepsSubDistritos]
    PRINT '<<< DROPPED TABLE [cepsSubDistritos] >>>'
END
go
IF OBJECT_ID('[continentes]') IS NOT NULL
BEGIN
    DROP TABLE [continentes]
    PRINT '<<< DROPPED TABLE [continentes] >>>'
END
go
IF OBJECT_ID('[continentesMundos]') IS NOT NULL
BEGIN
    DROP TABLE [continentesMundos]
    PRINT '<<< DROPPED TABLE [continentesMundos] >>>'
END
go
IF OBJECT_ID('[distritos]') IS NOT NULL
BEGIN
    DROP TABLE [distritos]
    PRINT '<<< DROPPED TABLE [distritos] >>>'
END
go
IF OBJECT_ID('[distritosMunicipio]') IS NOT NULL
BEGIN
    DROP TABLE [distritosMunicipio]
    PRINT '<<< DROPPED TABLE [distritosMunicipio] >>>'
END
go
IF OBJECT_ID('[enderecos]') IS NOT NULL
BEGIN
    DROP TABLE [enderecos]
    PRINT '<<< DROPPED TABLE [enderecos] >>>'
END
go
IF OBJECT_ID('[enderecosTipos]') IS NOT NULL
BEGIN
    DROP TABLE [enderecosTipos]
    PRINT '<<< DROPPED TABLE [enderecosTipos] >>>'
END
go
IF OBJECT_ID('[enderecosTiposEnderecos]') IS NOT NULL
BEGIN
    DROP TABLE [enderecosTiposEnderecos]
    PRINT '<<< DROPPED TABLE [enderecosTiposEnderecos] >>>'
END
go
IF OBJECT_ID('[logradouros]') IS NOT NULL
BEGIN
    DROP TABLE [logradouros]
    PRINT '<<< DROPPED TABLE [logradouros] >>>'
END
go
IF OBJECT_ID('[logradouroTipo]') IS NOT NULL
BEGIN
    DROP TABLE [logradouroTipo]
    PRINT '<<< DROPPED TABLE [logradouroTipo] >>>'
END
go
IF OBJECT_ID('[logradouroTipoLogradouro]') IS NOT NULL
BEGIN
    DROP TABLE [logradouroTipoLogradouro]
    PRINT '<<< DROPPED TABLE [logradouroTipoLogradouro] >>>'
END
go
IF OBJECT_ID('[mesoRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [mesoRegioes]
    PRINT '<<< DROPPED TABLE [mesoRegioes] >>>'
END
go
IF OBJECT_ID('[mesoRegioesUnidadeFederacao]') IS NOT NULL
BEGIN
    DROP TABLE [mesoRegioesUnidadeFederacao]
    PRINT '<<< DROPPED TABLE [mesoRegioesUnidadeFederacao] >>>'
END
go
IF OBJECT_ID('[microRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [microRegioes]
    PRINT '<<< DROPPED TABLE [microRegioes] >>>'
END
go
IF OBJECT_ID('[microRegioesMesoRegiao]') IS NOT NULL
BEGIN
    DROP TABLE [microRegioesMesoRegiao]
    PRINT '<<< DROPPED TABLE [microRegioesMesoRegiao] >>>'
END
go
IF OBJECT_ID('[mundos]') IS NOT NULL
BEGIN
    DROP TABLE [mundos]
    PRINT '<<< DROPPED TABLE [mundos] >>>'
END
go
IF OBJECT_ID('[municipios]') IS NOT NULL
BEGIN
    DROP TABLE [municipios]
    PRINT '<<< DROPPED TABLE [municipios] >>>'
END
go
IF OBJECT_ID('[municipiosMicroRegiao]') IS NOT NULL
BEGIN
    DROP TABLE [municipiosMicroRegiao]
    PRINT '<<< DROPPED TABLE [municipiosMicroRegiao] >>>'
END
go
IF OBJECT_ID('[municipiosRegiaoImediata]') IS NOT NULL
BEGIN
    DROP TABLE [municipiosRegiaoImediata]
    PRINT '<<< DROPPED TABLE [municipiosRegiaoImediata] >>>'
END
go
IF OBJECT_ID('[nacoes]') IS NOT NULL
BEGIN
    DROP TABLE [nacoes]
    PRINT '<<< DROPPED TABLE [nacoes] >>>'
END
go
IF OBJECT_ID('[nacoesContinentes]') IS NOT NULL
BEGIN
    DROP TABLE [nacoesContinentes]
    PRINT '<<< DROPPED TABLE [nacoesContinentes] >>>'
END
go
IF OBJECT_ID('[nacoesMundos]') IS NOT NULL
BEGIN
    DROP TABLE [nacoesMundos]
    PRINT '<<< DROPPED TABLE [nacoesMundos] >>>'
END
go
IF OBJECT_ID('[nacoesPaises]') IS NOT NULL
BEGIN
    DROP TABLE [nacoesPaises]
    PRINT '<<< DROPPED TABLE [nacoesPaises] >>>'
END
go
IF OBJECT_ID('[nacoesRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [nacoesRegioes]
    PRINT '<<< DROPPED TABLE [nacoesRegioes] >>>'
END
go
IF OBJECT_ID('[nacoesSubRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [nacoesSubRegioes]
    PRINT '<<< DROPPED TABLE [nacoesSubRegioes] >>>'
END
go
IF OBJECT_ID('[paises]') IS NOT NULL
BEGIN
    DROP TABLE [paises]
    PRINT '<<< DROPPED TABLE [paises] >>>'
END
go
IF OBJECT_ID('[paisesRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [paisesRegioes]
    PRINT '<<< DROPPED TABLE [paisesRegioes] >>>'
END
go
IF OBJECT_ID('[paisesSubRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [paisesSubRegioes]
    PRINT '<<< DROPPED TABLE [paisesSubRegioes] >>>'
END
go
IF OBJECT_ID('[regiao]') IS NOT NULL
BEGIN
    DROP TABLE [regiao]
    PRINT '<<< DROPPED TABLE [regiao] >>>'
END
go
IF OBJECT_ID('[regioes]') IS NOT NULL
BEGIN
    DROP TABLE [regioes]
    PRINT '<<< DROPPED TABLE [regioes] >>>'
END
go
IF OBJECT_ID('[regioes]') IS NOT NULL
BEGIN
    DROP TABLE [regioes]
    PRINT '<<< DROPPED TABLE [regioes] >>>'
END
go
IF OBJECT_ID('[regioesContinentes]') IS NOT NULL
BEGIN
    DROP TABLE [regioesContinentes]
    PRINT '<<< DROPPED TABLE [regioesContinentes] >>>'
END
go
IF OBJECT_ID('[regioesImediatas]') IS NOT NULL
BEGIN
    DROP TABLE [regioesImediatas]
    PRINT '<<< DROPPED TABLE [regioesImediatas] >>>'
END
go
IF OBJECT_ID('[regioesImediatasRegiaoIntermediaria]') IS NOT NULL
BEGIN
    DROP TABLE [regioesImediatasRegiaoIntermediaria]
    PRINT '<<< DROPPED TABLE [regioesImediatasRegiaoIntermediaria] >>>'
END
go
IF OBJECT_ID('[regioesIntermediarias]') IS NOT NULL
BEGIN
    DROP TABLE [regioesIntermediarias]
    PRINT '<<< DROPPED TABLE [regioesIntermediarias] >>>'
END
go
IF OBJECT_ID('[regioesIntermediariasUnidadeFederacao]') IS NOT NULL
BEGIN
    DROP TABLE [regioesIntermediariasUnidadeFederacao]
    PRINT '<<< DROPPED TABLE [regioesIntermediariasUnidadeFederacao] >>>'
END
go
IF OBJECT_ID('[regioesNacoes]') IS NOT NULL
BEGIN
    DROP TABLE [regioesNacoes]
    PRINT '<<< DROPPED TABLE [regioesNacoes] >>>'
END
go
IF OBJECT_ID('[regioesSubRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [regioesSubRegioes]
    PRINT '<<< DROPPED TABLE [regioesSubRegioes] >>>'
END
go
IF OBJECT_ID('[setores]') IS NOT NULL
BEGIN
    DROP TABLE [setores]
    PRINT '<<< DROPPED TABLE [setores] >>>'
END
go
IF OBJECT_ID('[setoresSubRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [setoresSubRegioes]
    PRINT '<<< DROPPED TABLE [setoresSubRegioes] >>>'
END
go
IF OBJECT_ID('[setoresSubSetores]') IS NOT NULL
BEGIN
    DROP TABLE [setoresSubSetores]
    PRINT '<<< DROPPED TABLE [setoresSubSetores] >>>'
END
go
IF OBJECT_ID('[subDistritos]') IS NOT NULL
BEGIN
    DROP TABLE [subDistritos]
    PRINT '<<< DROPPED TABLE [subDistritos] >>>'
END
go
IF OBJECT_ID('[subDistritosDistrito]') IS NOT NULL
BEGIN
    DROP TABLE [subDistritosDistrito]
    PRINT '<<< DROPPED TABLE [subDistritosDistrito] >>>'
END
go
IF OBJECT_ID('[subDistritosMunicipio]') IS NOT NULL
BEGIN
    DROP TABLE [subDistritosMunicipio]
    PRINT '<<< DROPPED TABLE [subDistritosMunicipio] >>>'
END
go
IF OBJECT_ID('[subRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [subRegioes]
    PRINT '<<< DROPPED TABLE [subRegioes] >>>'
END
go
IF OBJECT_ID('[subRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [subRegioes]
    PRINT '<<< DROPPED TABLE [subRegioes] >>>'
END
go
IF OBJECT_ID('[subRegioesRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [subRegioesRegioes]
    PRINT '<<< DROPPED TABLE [subRegioesRegioes] >>>'
END
go
IF OBJECT_ID('[subSetorDivisoes]') IS NOT NULL
BEGIN
    DROP TABLE [subSetorDivisoes]
    PRINT '<<< DROPPED TABLE [subSetorDivisoes] >>>'
END
go
IF OBJECT_ID('[subSetorDivisoesSubSetores]') IS NOT NULL
BEGIN
    DROP TABLE [subSetorDivisoesSubSetores]
    PRINT '<<< DROPPED TABLE [subSetorDivisoesSubSetores] >>>'
END
go
IF OBJECT_ID('[subSetores]') IS NOT NULL
BEGIN
    DROP TABLE [subSetores]
    PRINT '<<< DROPPED TABLE [subSetores] >>>'
END
go
IF OBJECT_ID('[sufixos]') IS NOT NULL
BEGIN
    DROP TABLE [sufixos]
    PRINT '<<< DROPPED TABLE [sufixos] >>>'
END
go
IF OBJECT_ID('[sufixosTipos]') IS NOT NULL
BEGIN
    DROP TABLE [sufixosTipos]
    PRINT '<<< DROPPED TABLE [sufixosTipos] >>>'
END
go
IF OBJECT_ID('[sufixosTiposSufixos]') IS NOT NULL
BEGIN
    DROP TABLE [sufixosTiposSufixos]
    PRINT '<<< DROPPED TABLE [sufixosTiposSufixos] >>>'
END
go
IF OBJECT_ID('[unidadesFederacao]') IS NOT NULL
BEGIN
    DROP TABLE [unidadesFederacao]
    PRINT '<<< DROPPED TABLE [unidadesFederacao] >>>'
END
go
IF OBJECT_ID('[unidadesFederacaoRegiao]') IS NOT NULL
BEGIN
    DROP TABLE [unidadesFederacaoRegiao]
    PRINT '<<< DROPPED TABLE [unidadesFederacaoRegiao] >>>'
END
go
