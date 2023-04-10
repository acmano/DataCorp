/* 
 * TABLE: [cep].[cepLogradouroEnderecos] 
 */

ALTER TABLE [cep].[cepLogradouroEnderecos] ADD CONSTRAINT [cepLogEndFkCepLog] 
    FOREIGN KEY ([cepLogID])
    REFERENCES [cep].[cepsLogradouros]([cepLogID])
go

ALTER TABLE [cep].[cepLogradouroEnderecos] ADD CONSTRAINT [endFkCepEnd] 
    FOREIGN KEY ([endID])
    REFERENCES [cep].[enderecos]([endID])
go


/* 
 * TABLE: [cep].[ceps] 
 */

ALTER TABLE [cep].[ceps] ADD CONSTRAINT [cepFkSubSetDiv] 
    FOREIGN KEY ([subSetDivID])
    REFERENCES [cep].[subSetorDivisoes]([subSetDivID])
go

ALTER TABLE [cep].[ceps] ADD CONSTRAINT [cepFkSuf] 
    FOREIGN KEY ([sufID])
    REFERENCES [cep].[sufixos]([sufID])
go


/* 
 * TABLE: [cep].[cepsDistritos] 
 */

ALTER TABLE [cep].[cepsDistritos] ADD CONSTRAINT [cepFkCepDis] 
    FOREIGN KEY ([cepID])
    REFERENCES [cep].[ceps]([cepID])
go

ALTER TABLE [cep].[cepsDistritos] ADD CONSTRAINT [disFkCepDis] 
    FOREIGN KEY ([disID])
    REFERENCES [ibge].[distritos]([disID])
go


/* 
 * TABLE: [cep].[cepsLogradouros] 
 */

ALTER TABLE [cep].[cepsLogradouros] ADD CONSTRAINT [cepFkCepLog] 
    FOREIGN KEY ([cepID])
    REFERENCES [cep].[ceps]([cepID])
go

ALTER TABLE [cep].[cepsLogradouros] ADD CONSTRAINT [cepLogFkLogTipLog] 
    FOREIGN KEY ([logTipLogID])
    REFERENCES [cep].[logradouroTipoLogradouro]([logTipLogID])
go


/* 
 * TABLE: [cep].[cepsMunicipios] 
 */

ALTER TABLE [cep].[cepsMunicipios] ADD CONSTRAINT [cepFkCepMun] 
    FOREIGN KEY ([cepID])
    REFERENCES [cep].[ceps]([cepID])
go

ALTER TABLE [cep].[cepsMunicipios] ADD CONSTRAINT [munFkCepMun] 
    FOREIGN KEY ([munID])
    REFERENCES [ibge].[municipios]([munID])
go


/* 
 * TABLE: [cep].[cepsSubDistritos] 
 */

ALTER TABLE [cep].[cepsSubDistritos] ADD CONSTRAINT [cepFkCepSubDis] 
    FOREIGN KEY ([cepID])
    REFERENCES [cep].[ceps]([cepID])
go

ALTER TABLE [cep].[cepsSubDistritos] ADD CONSTRAINT [subDisFkCepDis] 
    FOREIGN KEY ([subDisID])
    REFERENCES [ibge].[subDistritos]([subDisID])
go


/* 
 * TABLE: [cep].[enderecosTiposEnderecos] 
 */

ALTER TABLE [cep].[enderecosTiposEnderecos] ADD CONSTRAINT [endFkEndTipEnd] 
    FOREIGN KEY ([endID])
    REFERENCES [cep].[enderecos]([endID])
go

ALTER TABLE [cep].[enderecosTiposEnderecos] ADD CONSTRAINT [endTipEndFkEndTip] 
    FOREIGN KEY ([endTipID])
    REFERENCES [cep].[enderecosTipos]([endTipID])
go


/* 
 * TABLE: [cep].[logradouroTipoLogradouro] 
 */

ALTER TABLE [cep].[logradouroTipoLogradouro] ADD CONSTRAINT [logTipLogFkLog] 
    FOREIGN KEY ([logID])
    REFERENCES [cep].[logradouros]([logID])
go

ALTER TABLE [cep].[logradouroTipoLogradouro] ADD CONSTRAINT [logTipLogFkLogTip] 
    FOREIGN KEY ([logTipID])
    REFERENCES [cep].[logradouroTipo]([logTipID])
go


/* 
 * TABLE: [cep].[regioesSubRegioes] 
 */

ALTER TABLE [cep].[regioesSubRegioes] ADD CONSTRAINT [subRegRegFkSubReg] 
    FOREIGN KEY ([subRegID])
    REFERENCES [cep].[subRegioes]([subRegID])
go

ALTER TABLE [cep].[regioesSubRegioes] ADD CONSTRAINT [sugRegRegFkReg] 
    FOREIGN KEY ([regID])
    REFERENCES [cep].[regioes]([regID])
go


/* 
 * TABLE: [cep].[setoresSubRegioes] 
 */

ALTER TABLE [cep].[setoresSubRegioes] ADD CONSTRAINT [setSubRegFkSet] 
    FOREIGN KEY ([setID])
    REFERENCES [cep].[setores]([setID])
go

ALTER TABLE [cep].[setoresSubRegioes] ADD CONSTRAINT [setSubRegFkSubReg] 
    FOREIGN KEY ([subRegID])
    REFERENCES [cep].[subRegioes]([subRegID])
go


/* 
 * TABLE: [cep].[setoresSubSetores] 
 */

ALTER TABLE [cep].[setoresSubSetores] ADD CONSTRAINT [subSetSetFkSet] 
    FOREIGN KEY ([setID])
    REFERENCES [cep].[setores]([setID])
go

ALTER TABLE [cep].[setoresSubSetores] ADD CONSTRAINT [subSetSetFkSubSet] 
    FOREIGN KEY ([subSetID])
    REFERENCES [cep].[subSetores]([subSetID])
go


/* 
 * TABLE: [cep].[subSetorDivisoesSubSetores] 
 */

ALTER TABLE [cep].[subSetorDivisoesSubSetores] ADD CONSTRAINT [subSetDivSubSetFkSubSet] 
    FOREIGN KEY ([subSetID])
    REFERENCES [cep].[subSetores]([subSetID])
go

ALTER TABLE [cep].[subSetorDivisoesSubSetores] ADD CONSTRAINT [subSetDivSubSetFkSubSetDiv] 
    FOREIGN KEY ([subSetDivID])
    REFERENCES [cep].[subSetorDivisoes]([subSetDivID])
go


/* 
 * TABLE: [cep].[sufixosTiposSufixos] 
 */

ALTER TABLE [cep].[sufixosTiposSufixos] ADD CONSTRAINT [sufTipSufFkSuf] 
    FOREIGN KEY ([sufID])
    REFERENCES [cep].[sufixos]([sufID])
go

ALTER TABLE [cep].[sufixosTiposSufixos] ADD CONSTRAINT [sufTipSufFkSufTip] 
    FOREIGN KEY ([sufTipID])
    REFERENCES [cep].[sufixosTipos]([sufTipID])
go


/* 
 * TABLE: [geo].[continentesMundos] 
 */

ALTER TABLE [geo].[continentesMundos] ADD CONSTRAINT [ctnFkCtnMun] 
    FOREIGN KEY ([ctnID])
    REFERENCES [geo].[continentes]([ctnID])
go

ALTER TABLE [geo].[continentesMundos] ADD CONSTRAINT [munFkCtnMun] 
    FOREIGN KEY ([munID])
    REFERENCES [geo].[mundos]([munID])
go


/* 
 * TABLE: [geo].[nacoesContinentes] 
 */

ALTER TABLE [geo].[nacoesContinentes] ADD CONSTRAINT [ctnFkNacCtn] 
    FOREIGN KEY ([ctnID])
    REFERENCES [geo].[continentes]([ctnID])
go

ALTER TABLE [geo].[nacoesContinentes] ADD CONSTRAINT [nacFkNacCtn] 
    FOREIGN KEY ([nacID])
    REFERENCES [geo].[nacoes]([nacID])
go


/* 
 * TABLE: [geo].[nacoesMundos] 
 */

ALTER TABLE [geo].[nacoesMundos] ADD CONSTRAINT [munFkNacMun] 
    FOREIGN KEY ([munID])
    REFERENCES [geo].[mundos]([munID])
go

ALTER TABLE [geo].[nacoesMundos] ADD CONSTRAINT [nacFkEntMun] 
    FOREIGN KEY ([nacID])
    REFERENCES [geo].[nacoes]([nacID])
go


/* 
 * TABLE: [geo].[nacoesPaises] 
 */

ALTER TABLE [geo].[nacoesPaises] ADD CONSTRAINT [nacFkEntPai] 
    FOREIGN KEY ([nacID])
    REFERENCES [geo].[nacoes]([nacID])
go

ALTER TABLE [geo].[nacoesPaises] ADD CONSTRAINT [paiFkNacPai] 
    FOREIGN KEY ([paiID])
    REFERENCES [geo].[paises]([paiID])
go


/* 
 * TABLE: [geo].[nacoesRegioes] 
 */

ALTER TABLE [geo].[nacoesRegioes] ADD CONSTRAINT [nacFkEntReg] 
    FOREIGN KEY ([nacID])
    REFERENCES [geo].[nacoes]([nacID])
go

ALTER TABLE [geo].[nacoesRegioes] ADD CONSTRAINT [regFkNacReg] 
    FOREIGN KEY ([regID])
    REFERENCES [geo].[regioes]([regID])
go


/* 
 * TABLE: [geo].[nacoesSubRegioes] 
 */

ALTER TABLE [geo].[nacoesSubRegioes] ADD CONSTRAINT [nacFkNacSubReg] 
    FOREIGN KEY ([nacID])
    REFERENCES [geo].[nacoes]([nacID])
go

ALTER TABLE [geo].[nacoesSubRegioes] ADD CONSTRAINT [subRegFkNacSubReg] 
    FOREIGN KEY ([subRegID])
    REFERENCES [geo].[subRegioes]([subRegID])
go


/* 
 * TABLE: [geo].[paisesRegioes] 
 */

ALTER TABLE [geo].[paisesRegioes] ADD CONSTRAINT [paiFkPaiReg] 
    FOREIGN KEY ([paiID])
    REFERENCES [geo].[paises]([paiID])
go

ALTER TABLE [geo].[paisesRegioes] ADD CONSTRAINT [regFkPaiReg] 
    FOREIGN KEY ([regID])
    REFERENCES [geo].[regioes]([regID])
go


/* 
 * TABLE: [geo].[paisesSubRegioes] 
 */

ALTER TABLE [geo].[paisesSubRegioes] ADD CONSTRAINT [paiFkPaiSubReg] 
    FOREIGN KEY ([paiID])
    REFERENCES [geo].[paises]([paiID])
go

ALTER TABLE [geo].[paisesSubRegioes] ADD CONSTRAINT [subRegFkPaiSubReg] 
    FOREIGN KEY ([subRegID])
    REFERENCES [geo].[subRegioes]([subRegID])
go


/* 
 * TABLE: [geo].[regioesContinentes] 
 */

ALTER TABLE [geo].[regioesContinentes] ADD CONSTRAINT [ctnFkRegCtn] 
    FOREIGN KEY ([ctnID])
    REFERENCES [geo].[continentes]([ctnID])
go

ALTER TABLE [geo].[regioesContinentes] ADD CONSTRAINT [regFkRegCtn] 
    FOREIGN KEY ([regID])
    REFERENCES [geo].[regioes]([regID])
go


/* 
 * TABLE: [geo].[subRegioesRegioes] 
 */

ALTER TABLE [geo].[subRegioesRegioes] ADD CONSTRAINT [regFkSubRegReg] 
    FOREIGN KEY ([regID])
    REFERENCES [geo].[regioes]([regID])
go

ALTER TABLE [geo].[subRegioesRegioes] ADD CONSTRAINT [subRegFkSubRegReg] 
    FOREIGN KEY ([subRegID])
    REFERENCES [geo].[subRegioes]([subRegID])
go


/* 
 * TABLE: [ibge].[distritosMunicipio] 
 */

ALTER TABLE [ibge].[distritosMunicipio] ADD CONSTRAINT [disFkDisMun] 
    FOREIGN KEY ([disID])
    REFERENCES [ibge].[distritos]([disID])
go

ALTER TABLE [ibge].[distritosMunicipio] ADD CONSTRAINT [munFkDisMun] 
    FOREIGN KEY ([munID])
    REFERENCES [ibge].[municipios]([munID])
go


/* 
 * TABLE: [ibge].[mesoRegioesUnidadeFederacao] 
 */

ALTER TABLE [ibge].[mesoRegioesUnidadeFederacao] ADD CONSTRAINT [mesRegFkMesRegUniFed] 
    FOREIGN KEY ([mesRegID])
    REFERENCES [ibge].[mesoRegioes]([mesRegID])
go

ALTER TABLE [ibge].[mesoRegioesUnidadeFederacao] ADD CONSTRAINT [uniFedFkMesRegUniFed] 
    FOREIGN KEY ([uniFedID])
    REFERENCES [ibge].[unidadesFederacao]([uniFedID])
go


/* 
 * TABLE: [ibge].[microRegioesMesoRegiao] 
 */

ALTER TABLE [ibge].[microRegioesMesoRegiao] ADD CONSTRAINT [mesRegFkMicRegMesReg] 
    FOREIGN KEY ([mesRegID])
    REFERENCES [ibge].[mesoRegioes]([mesRegID])
go

ALTER TABLE [ibge].[microRegioesMesoRegiao] ADD CONSTRAINT [micRegFkMicRegMesReg] 
    FOREIGN KEY ([micRegID])
    REFERENCES [ibge].[microRegioes]([micRegID])
go


/* 
 * TABLE: [ibge].[municipiosMicroRegiao] 
 */

ALTER TABLE [ibge].[municipiosMicroRegiao] ADD CONSTRAINT [micRegFkMunMicReg] 
    FOREIGN KEY ([micRegID])
    REFERENCES [ibge].[microRegioes]([micRegID])
go

ALTER TABLE [ibge].[municipiosMicroRegiao] ADD CONSTRAINT [munFkMunMicReg] 
    FOREIGN KEY ([munID])
    REFERENCES [ibge].[municipios]([munID])
go


/* 
 * TABLE: [ibge].[municipiosRegiaoImediata] 
 */

ALTER TABLE [ibge].[municipiosRegiaoImediata] ADD CONSTRAINT [munFkMunRegIme] 
    FOREIGN KEY ([munID])
    REFERENCES [ibge].[municipios]([munID])
go

ALTER TABLE [ibge].[municipiosRegiaoImediata] ADD CONSTRAINT [regImeFkMunRegIme] 
    FOREIGN KEY ([regImeID])
    REFERENCES [ibge].[regioesImediatas]([regImeID])
go


/* 
 * TABLE: [ibge].[regioesImediatasRegiaoIntermediaria] 
 */

ALTER TABLE [ibge].[regioesImediatasRegiaoIntermediaria] ADD CONSTRAINT [regIntFkRegImeRegInt] 
    FOREIGN KEY ([regIntID])
    REFERENCES [ibge].[regioesIntermediarias]([regIntID])
go

ALTER TABLE [ibge].[regioesImediatasRegiaoIntermediaria] ADD CONSTRAINT [regIntFkRegImeRegInt] 
    FOREIGN KEY ([regImeID])
    REFERENCES [ibge].[regioesImediatas]([regImeID])
go


/* 
 * TABLE: [ibge].[regioesIntermediariasUnidadeFederacao] 
 */

ALTER TABLE [ibge].[regioesIntermediariasUnidadeFederacao] ADD CONSTRAINT [regIntFkRegIntUniFed] 
    FOREIGN KEY ([regIntID])
    REFERENCES [ibge].[regioesIntermediarias]([regIntID])
go

ALTER TABLE [ibge].[regioesIntermediariasUnidadeFederacao] ADD CONSTRAINT [uniFedFkRegIntUniFed] 
    FOREIGN KEY ([uniFedID])
    REFERENCES [ibge].[unidadesFederacao]([uniFedID])
go


/* 
 * TABLE: [ibge].[regioesNacoes] 
 */

ALTER TABLE [ibge].[regioesNacoes] ADD CONSTRAINT [regNacFkNac] 
    FOREIGN KEY ([nacID])
    REFERENCES [geo].[nacoes]([nacID])
go

ALTER TABLE [ibge].[regioesNacoes] ADD CONSTRAINT [regNacFkReg] 
    FOREIGN KEY ([regID])
    REFERENCES [ibge].[regiao]([regID])
go


/* 
 * TABLE: [ibge].[subDistritosDistrito] 
 */

ALTER TABLE [ibge].[subDistritosDistrito] ADD CONSTRAINT [disFkSubDisDis] 
    FOREIGN KEY ([disID])
    REFERENCES [ibge].[distritos]([disID])
go

ALTER TABLE [ibge].[subDistritosDistrito] ADD CONSTRAINT [subDisFkSubDisDis] 
    FOREIGN KEY ([subDisID])
    REFERENCES [ibge].[subDistritos]([subDisID])
go


/* 
 * TABLE: [ibge].[subDistritosMunicipio] 
 */

ALTER TABLE [ibge].[subDistritosMunicipio] ADD CONSTRAINT [munFkSubDisMun] 
    FOREIGN KEY ([munID])
    REFERENCES [ibge].[municipios]([munID])
go

ALTER TABLE [ibge].[subDistritosMunicipio] ADD CONSTRAINT [subDisFkSubDisMun] 
    FOREIGN KEY ([subDisID])
    REFERENCES [ibge].[subDistritos]([subDisID])
go


/* 
 * TABLE: [ibge].[unidadesFederacaoRegiao] 
 */

ALTER TABLE [ibge].[unidadesFederacaoRegiao] ADD CONSTRAINT [regFkUniFedReg] 
    FOREIGN KEY ([regID])
    REFERENCES [ibge].[regiao]([regID])
go

ALTER TABLE [ibge].[unidadesFederacaoRegiao] ADD CONSTRAINT [uniFedFkUniFedReg] 
    FOREIGN KEY ([uniFedID])
    REFERENCES [ibge].[unidadesFederacao]([uniFedID])
go


