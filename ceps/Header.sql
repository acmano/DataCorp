/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      DataCorp.DM1
 * Author :       Antonio Carlos Mano
 *
 * Date Created : Friday, March 17, 2023 13:24:26
 * Target DBMS : Microsoft SQL Server 2017
 */

USE DataCorp
go
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

IF OBJECT_ID('[cep].[cepLogradouroEnderecos]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[cepLogradouroEnderecos]
    PRINT '<<< DROPPED TABLE [cep].[cepLogradouroEnderecos] >>>'
END
go
IF OBJECT_ID('[cep].[ceps]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[ceps]
    PRINT '<<< DROPPED TABLE [cep].[ceps] >>>'
END
go
IF OBJECT_ID('[cep].[cepsDistritos]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[cepsDistritos]
    PRINT '<<< DROPPED TABLE [cep].[cepsDistritos] >>>'
END
go
IF OBJECT_ID('[cep].[cepsLogradouros]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[cepsLogradouros]
    PRINT '<<< DROPPED TABLE [cep].[cepsLogradouros] >>>'
END
go
IF OBJECT_ID('[cep].[cepsMunicipios]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[cepsMunicipios]
    PRINT '<<< DROPPED TABLE [cep].[cepsMunicipios] >>>'
END
go
IF OBJECT_ID('[cep].[cepsSubDistritos]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[cepsSubDistritos]
    PRINT '<<< DROPPED TABLE [cep].[cepsSubDistritos] >>>'
END
go
IF OBJECT_ID('[cep].[enderecos]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[enderecos]
    PRINT '<<< DROPPED TABLE [cep].[enderecos] >>>'
END
go
IF OBJECT_ID('[cep].[enderecosTipos]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[enderecosTipos]
    PRINT '<<< DROPPED TABLE [cep].[enderecosTipos] >>>'
END
go
IF OBJECT_ID('[cep].[enderecosTiposEnderecos]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[enderecosTiposEnderecos]
    PRINT '<<< DROPPED TABLE [cep].[enderecosTiposEnderecos] >>>'
END
go
IF OBJECT_ID('[cep].[logradouros]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[logradouros]
    PRINT '<<< DROPPED TABLE [cep].[logradouros] >>>'
END
go
IF OBJECT_ID('[cep].[logradouroTipo]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[logradouroTipo]
    PRINT '<<< DROPPED TABLE [cep].[logradouroTipo] >>>'
END
go
IF OBJECT_ID('[cep].[logradouroTipoLogradouro]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[logradouroTipoLogradouro]
    PRINT '<<< DROPPED TABLE [cep].[logradouroTipoLogradouro] >>>'
END
go
IF OBJECT_ID('[cep].[regioes]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[regioes]
    PRINT '<<< DROPPED TABLE [cep].[regioes] >>>'
END
go
IF OBJECT_ID('[cep].[regioesSubRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[regioesSubRegioes]
    PRINT '<<< DROPPED TABLE [cep].[regioesSubRegioes] >>>'
END
go
IF OBJECT_ID('[cep].[setores]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[setores]
    PRINT '<<< DROPPED TABLE [cep].[setores] >>>'
END
go
IF OBJECT_ID('[cep].[setoresSubRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[setoresSubRegioes]
    PRINT '<<< DROPPED TABLE [cep].[setoresSubRegioes] >>>'
END
go
IF OBJECT_ID('[cep].[setoresSubSetores]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[setoresSubSetores]
    PRINT '<<< DROPPED TABLE [cep].[setoresSubSetores] >>>'
END
go
IF OBJECT_ID('[cep].[subRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[subRegioes]
    PRINT '<<< DROPPED TABLE [cep].[subRegioes] >>>'
END
go
IF OBJECT_ID('[cep].[subSetorDivisoes]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[subSetorDivisoes]
    PRINT '<<< DROPPED TABLE [cep].[subSetorDivisoes] >>>'
END
go
IF OBJECT_ID('[cep].[subSetorDivisoesSubSetores]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[subSetorDivisoesSubSetores]
    PRINT '<<< DROPPED TABLE [cep].[subSetorDivisoesSubSetores] >>>'
END
go
IF OBJECT_ID('[cep].[subSetores]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[subSetores]
    PRINT '<<< DROPPED TABLE [cep].[subSetores] >>>'
END
go
IF OBJECT_ID('[cep].[sufixos]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[sufixos]
    PRINT '<<< DROPPED TABLE [cep].[sufixos] >>>'
END
go
IF OBJECT_ID('[cep].[sufixosTipos]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[sufixosTipos]
    PRINT '<<< DROPPED TABLE [cep].[sufixosTipos] >>>'
END
go
IF OBJECT_ID('[cep].[sufixosTiposSufixos]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[sufixosTiposSufixos]
    PRINT '<<< DROPPED TABLE [cep].[sufixosTiposSufixos] >>>'
END
go
IF OBJECT_ID('[geo].[continentes]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[continentes]
    PRINT '<<< DROPPED TABLE [geo].[continentes] >>>'
END
go
IF OBJECT_ID('[geo].[continentesMundos]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[continentesMundos]
    PRINT '<<< DROPPED TABLE [geo].[continentesMundos] >>>'
END
go
IF OBJECT_ID('[geo].[mundos]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[mundos]
    PRINT '<<< DROPPED TABLE [geo].[mundos] >>>'
END
go
IF OBJECT_ID('[geo].[nacoes]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[nacoes]
    PRINT '<<< DROPPED TABLE [geo].[nacoes] >>>'
END
go
IF OBJECT_ID('[geo].[nacoesContinentes]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[nacoesContinentes]
    PRINT '<<< DROPPED TABLE [geo].[nacoesContinentes] >>>'
END
go
IF OBJECT_ID('[geo].[nacoesMundos]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[nacoesMundos]
    PRINT '<<< DROPPED TABLE [geo].[nacoesMundos] >>>'
END
go
IF OBJECT_ID('[geo].[nacoesPaises]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[nacoesPaises]
    PRINT '<<< DROPPED TABLE [geo].[nacoesPaises] >>>'
END
go
IF OBJECT_ID('[geo].[nacoesRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[nacoesRegioes]
    PRINT '<<< DROPPED TABLE [geo].[nacoesRegioes] >>>'
END
go
IF OBJECT_ID('[geo].[nacoesSubRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[nacoesSubRegioes]
    PRINT '<<< DROPPED TABLE [geo].[nacoesSubRegioes] >>>'
END
go
IF OBJECT_ID('[geo].[paises]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[paises]
    PRINT '<<< DROPPED TABLE [geo].[paises] >>>'
END
go
IF OBJECT_ID('[geo].[paisesRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[paisesRegioes]
    PRINT '<<< DROPPED TABLE [geo].[paisesRegioes] >>>'
END
go
IF OBJECT_ID('[geo].[paisesSubRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[paisesSubRegioes]
    PRINT '<<< DROPPED TABLE [geo].[paisesSubRegioes] >>>'
END
go
IF OBJECT_ID('[geo].[regioes]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[regioes]
    PRINT '<<< DROPPED TABLE [geo].[regioes] >>>'
END
go
IF OBJECT_ID('[geo].[regioesContinentes]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[regioesContinentes]
    PRINT '<<< DROPPED TABLE [geo].[regioesContinentes] >>>'
END
go
IF OBJECT_ID('[geo].[subRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[subRegioes]
    PRINT '<<< DROPPED TABLE [geo].[subRegioes] >>>'
END
go
IF OBJECT_ID('[geo].[subRegioesRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[subRegioesRegioes]
    PRINT '<<< DROPPED TABLE [geo].[subRegioesRegioes] >>>'
END
go
IF OBJECT_ID('[ibge].[distritos]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[distritos]
    PRINT '<<< DROPPED TABLE [ibge].[distritos] >>>'
END
go
IF OBJECT_ID('[ibge].[distritosMunicipio]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[distritosMunicipio]
    PRINT '<<< DROPPED TABLE [ibge].[distritosMunicipio] >>>'
END
go
IF OBJECT_ID('[ibge].[mesoRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[mesoRegioes]
    PRINT '<<< DROPPED TABLE [ibge].[mesoRegioes] >>>'
END
go
IF OBJECT_ID('[ibge].[mesoRegioesUnidadeFederacao]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[mesoRegioesUnidadeFederacao]
    PRINT '<<< DROPPED TABLE [ibge].[mesoRegioesUnidadeFederacao] >>>'
END
go
IF OBJECT_ID('[ibge].[microRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[microRegioes]
    PRINT '<<< DROPPED TABLE [ibge].[microRegioes] >>>'
END
go
IF OBJECT_ID('[ibge].[microRegioesMesoRegiao]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[microRegioesMesoRegiao]
    PRINT '<<< DROPPED TABLE [ibge].[microRegioesMesoRegiao] >>>'
END
go
IF OBJECT_ID('[ibge].[municipios]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[municipios]
    PRINT '<<< DROPPED TABLE [ibge].[municipios] >>>'
END
go
IF OBJECT_ID('[ibge].[municipiosMicroRegiao]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[municipiosMicroRegiao]
    PRINT '<<< DROPPED TABLE [ibge].[municipiosMicroRegiao] >>>'
END
go
IF OBJECT_ID('[ibge].[municipiosRegiaoImediata]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[municipiosRegiaoImediata]
    PRINT '<<< DROPPED TABLE [ibge].[municipiosRegiaoImediata] >>>'
END
go
IF OBJECT_ID('[ibge].[regiao]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[regiao]
    PRINT '<<< DROPPED TABLE [ibge].[regiao] >>>'
END
go
IF OBJECT_ID('[ibge].[regioesImediatas]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[regioesImediatas]
    PRINT '<<< DROPPED TABLE [ibge].[regioesImediatas] >>>'
END
go
IF OBJECT_ID('[ibge].[regioesImediatasRegiaoIntermediaria]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[regioesImediatasRegiaoIntermediaria]
    PRINT '<<< DROPPED TABLE [ibge].[regioesImediatasRegiaoIntermediaria] >>>'
END
go
IF OBJECT_ID('[ibge].[regioesIntermediarias]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[regioesIntermediarias]
    PRINT '<<< DROPPED TABLE [ibge].[regioesIntermediarias] >>>'
END
go
IF OBJECT_ID('[ibge].[regioesIntermediariasUnidadeFederacao]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[regioesIntermediariasUnidadeFederacao]
    PRINT '<<< DROPPED TABLE [ibge].[regioesIntermediariasUnidadeFederacao] >>>'
END
go
IF OBJECT_ID('[ibge].[regioesNacoes]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[regioesNacoes]
    PRINT '<<< DROPPED TABLE [ibge].[regioesNacoes] >>>'
END
go
IF OBJECT_ID('[ibge].[subDistritos]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[subDistritos]
    PRINT '<<< DROPPED TABLE [ibge].[subDistritos] >>>'
END
go
IF OBJECT_ID('[ibge].[subDistritosDistrito]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[subDistritosDistrito]
    PRINT '<<< DROPPED TABLE [ibge].[subDistritosDistrito] >>>'
END
go
IF OBJECT_ID('[ibge].[subDistritosMunicipio]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[subDistritosMunicipio]
    PRINT '<<< DROPPED TABLE [ibge].[subDistritosMunicipio] >>>'
END
go
IF OBJECT_ID('[ibge].[unidadesFederacao]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[unidadesFederacao]
    PRINT '<<< DROPPED TABLE [ibge].[unidadesFederacao] >>>'
END
go
IF OBJECT_ID('[ibge].[unidadesFederacaoRegiao]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[unidadesFederacaoRegiao]
    PRINT '<<< DROPPED TABLE [ibge].[unidadesFederacaoRegiao] >>>'
END
go
