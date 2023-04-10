/* 
 * TABLE: [cepLogradouroEnderecos] 
 */

ALTER TABLE [cepLogradouroEnderecos] ADD CONSTRAINT [cepLogEndFkCepLog] 
    FOREIGN KEY ([cepLogID])
    REFERENCES [cepsLogradouros]([cepLogID])
go

ALTER TABLE [cepLogradouroEnderecos] ADD CONSTRAINT [endFkCepEnd] 
    FOREIGN KEY ([endID])
    REFERENCES [enderecos]([endID])
go


/* 
 * TABLE: [ceps] 
 */

ALTER TABLE [ceps] ADD CONSTRAINT [cepFkSubSetDiv] 
    FOREIGN KEY ([subSetDivID])
    REFERENCES [subSetorDivisoes]([subSetDivID])
go

ALTER TABLE [ceps] ADD CONSTRAINT [cepFkSuf] 
    FOREIGN KEY ([sufID])
    REFERENCES [sufixos]([sufID])
go


/* 
 * TABLE: [cepsDistritos] 
 */

ALTER TABLE [cepsDistritos] ADD CONSTRAINT [cepFkCepDis] 
    FOREIGN KEY ([cepID])
    REFERENCES [ceps]([cepID])
go

ALTER TABLE [cepsDistritos] ADD CONSTRAINT [disFkCepDis] 
    FOREIGN KEY ([disID])
    REFERENCES [distritos]([disID])
go


/* 
 * TABLE: [cepsLogradouros] 
 */

ALTER TABLE [cepsLogradouros] ADD CONSTRAINT [cepFkCepLog] 
    FOREIGN KEY ([cepID])
    REFERENCES [ceps]([cepID])
go

ALTER TABLE [cepsLogradouros] ADD CONSTRAINT [cepLogFkLogTipLog] 
    FOREIGN KEY ([logTipLogID])
    REFERENCES [logradouroTipoLogradouro]([logTipLogID])
go


/* 
 * TABLE: [cepsMunicipios] 
 */

ALTER TABLE [cepsMunicipios] ADD CONSTRAINT [cepFkCepMun] 
    FOREIGN KEY ([cepID])
    REFERENCES [ceps]([cepID])
go

ALTER TABLE [cepsMunicipios] ADD CONSTRAINT [munFkCepMun] 
    FOREIGN KEY ([munID])
    REFERENCES [municipios]([munID])
go


/* 
 * TABLE: [cepsSubDistritos] 
 */

ALTER TABLE [cepsSubDistritos] ADD CONSTRAINT [cepFkCepSubDis] 
    FOREIGN KEY ([cepID])
    REFERENCES [ceps]([cepID])
go

ALTER TABLE [cepsSubDistritos] ADD CONSTRAINT [subDisFkCepDis] 
    FOREIGN KEY ([subDisID])
    REFERENCES [subDistritos]([subDisID])
go


/* 
 * TABLE: [continentesMundos] 
 */

ALTER TABLE [continentesMundos] ADD CONSTRAINT [ctnFkCtnMun] 
    FOREIGN KEY ([ctnID])
    REFERENCES [continentes]([ctnID])
go

ALTER TABLE [continentesMundos] ADD CONSTRAINT [munFkCtnMun] 
    FOREIGN KEY ([munID])
    REFERENCES [mundos]([munID])
go


/* 
 * TABLE: [distritosMunicipio] 
 */

ALTER TABLE [distritosMunicipio] ADD CONSTRAINT [disFkDisMun] 
    FOREIGN KEY ([disID])
    REFERENCES [distritos]([disID])
go

ALTER TABLE [distritosMunicipio] ADD CONSTRAINT [munFkDisMun] 
    FOREIGN KEY ([munID])
    REFERENCES [municipios]([munID])
go


/* 
 * TABLE: [enderecosTiposEnderecos] 
 */

ALTER TABLE [enderecosTiposEnderecos] ADD CONSTRAINT [endFkEndTipEnd] 
    FOREIGN KEY ([endID])
    REFERENCES [enderecos]([endID])
go

ALTER TABLE [enderecosTiposEnderecos] ADD CONSTRAINT [endTipEndFkEndTip] 
    FOREIGN KEY ([endTipID])
    REFERENCES [enderecosTipos]([endTipID])
go


/* 
 * TABLE: [logradouroTipoLogradouro] 
 */

ALTER TABLE [logradouroTipoLogradouro] ADD CONSTRAINT [logTipLogFkLog] 
    FOREIGN KEY ([logID])
    REFERENCES [logradouros]([logID])
go

ALTER TABLE [logradouroTipoLogradouro] ADD CONSTRAINT [logTipLogFkLogTip] 
    FOREIGN KEY ([logTipID])
    REFERENCES [logradouroTipo]([logTipID])
go


/* 
 * TABLE: [mesoRegioesUnidadeFederacao] 
 */

ALTER TABLE [mesoRegioesUnidadeFederacao] ADD CONSTRAINT [mesRegFkMesRegUniFed] 
    FOREIGN KEY ([mesRegID])
    REFERENCES [mesoRegioes]([mesRegID])
go

ALTER TABLE [mesoRegioesUnidadeFederacao] ADD CONSTRAINT [uniFedFkMesRegUniFed] 
    FOREIGN KEY ([uniFedID])
    REFERENCES [unidadesFederacao]([uniFedID])
go


/* 
 * TABLE: [microRegioesMesoRegiao] 
 */

ALTER TABLE [microRegioesMesoRegiao] ADD CONSTRAINT [mesRegFkMicRegMesReg] 
    FOREIGN KEY ([mesRegID])
    REFERENCES [mesoRegioes]([mesRegID])
go

ALTER TABLE [microRegioesMesoRegiao] ADD CONSTRAINT [micRegFkMicRegMesReg] 
    FOREIGN KEY ([micRegID])
    REFERENCES [microRegioes]([micRegID])
go


/* 
 * TABLE: [municipiosMicroRegiao] 
 */

ALTER TABLE [municipiosMicroRegiao] ADD CONSTRAINT [micRegFkMunMicReg] 
    FOREIGN KEY ([micRegID])
    REFERENCES [microRegioes]([micRegID])
go

ALTER TABLE [municipiosMicroRegiao] ADD CONSTRAINT [munFkMunMicReg] 
    FOREIGN KEY ([munID])
    REFERENCES [municipios]([munID])
go


/* 
 * TABLE: [municipiosRegiaoImediata] 
 */

ALTER TABLE [municipiosRegiaoImediata] ADD CONSTRAINT [munFkMunRegIme] 
    FOREIGN KEY ([munID])
    REFERENCES [municipios]([munID])
go

ALTER TABLE [municipiosRegiaoImediata] ADD CONSTRAINT [regImeFkMunRegIme] 
    FOREIGN KEY ([regImeID])
    REFERENCES [regioesImediatas]([regImeID])
go


/* 
 * TABLE: [nacoesContinentes] 
 */

ALTER TABLE [nacoesContinentes] ADD CONSTRAINT [ctnFkNacCtn] 
    FOREIGN KEY ([ctnID])
    REFERENCES [continentes]([ctnID])
go

ALTER TABLE [nacoesContinentes] ADD CONSTRAINT [nacFkNacCtn] 
    FOREIGN KEY ([nacID])
    REFERENCES [nacoes]([nacID])
go


/* 
 * TABLE: [nacoesMundos] 
 */

ALTER TABLE [nacoesMundos] ADD CONSTRAINT [munFkNacMun] 
    FOREIGN KEY ([munID])
    REFERENCES [mundos]([munID])
go

ALTER TABLE [nacoesMundos] ADD CONSTRAINT [nacFkEntMun] 
    FOREIGN KEY ([nacID])
    REFERENCES [nacoes]([nacID])
go


/* 
 * TABLE: [nacoesPaises] 
 */

ALTER TABLE [nacoesPaises] ADD CONSTRAINT [nacFkEntPai] 
    FOREIGN KEY ([nacID])
    REFERENCES [nacoes]([nacID])
go

ALTER TABLE [nacoesPaises] ADD CONSTRAINT [paiFkNacPai] 
    FOREIGN KEY ([paiID])
    REFERENCES [paises]([paiID])
go


/* 
 * TABLE: [nacoesRegioes] 
 */

ALTER TABLE [nacoesRegioes] ADD CONSTRAINT [nacFkEntReg] 
    FOREIGN KEY ([nacID])
    REFERENCES [nacoes]([nacID])
go

ALTER TABLE [nacoesRegioes] ADD CONSTRAINT [regFkNacReg] 
    FOREIGN KEY ([regID])
    REFERENCES [regioes]([regID])
go


/* 
 * TABLE: [nacoesSubRegioes] 
 */

ALTER TABLE [nacoesSubRegioes] ADD CONSTRAINT [nacFkNacSubReg] 
    FOREIGN KEY ([nacID])
    REFERENCES [nacoes]([nacID])
go

ALTER TABLE [nacoesSubRegioes] ADD CONSTRAINT [subRegFkNacSubReg] 
    FOREIGN KEY ([subRegID])
    REFERENCES [subRegioes]([subRegID])
go


/* 
 * TABLE: [paisesRegioes] 
 */

ALTER TABLE [paisesRegioes] ADD CONSTRAINT [paiFkPaiReg] 
    FOREIGN KEY ([paiID])
    REFERENCES [paises]([paiID])
go

ALTER TABLE [paisesRegioes] ADD CONSTRAINT [regFkPaiReg] 
    FOREIGN KEY ([regID])
    REFERENCES [regioes]([regID])
go


/* 
 * TABLE: [paisesSubRegioes] 
 */

ALTER TABLE [paisesSubRegioes] ADD CONSTRAINT [paiFkPaiSubReg] 
    FOREIGN KEY ([paiID])
    REFERENCES [paises]([paiID])
go

ALTER TABLE [paisesSubRegioes] ADD CONSTRAINT [subRegFkPaiSubReg] 
    FOREIGN KEY ([subRegID])
    REFERENCES [subRegioes]([subRegID])
go


/* 
 * TABLE: [regioesContinentes] 
 */

ALTER TABLE [regioesContinentes] ADD CONSTRAINT [ctnFkRegCtn] 
    FOREIGN KEY ([ctnID])
    REFERENCES [continentes]([ctnID])
go

ALTER TABLE [regioesContinentes] ADD CONSTRAINT [regFkRegCtn] 
    FOREIGN KEY ([regID])
    REFERENCES [regioes]([regID])
go


/* 
 * TABLE: [regioesImediatasRegiaoIntermediaria] 
 */

ALTER TABLE [regioesImediatasRegiaoIntermediaria] ADD CONSTRAINT [regIntFkRegImeRegInt] 
    FOREIGN KEY ([regIntID])
    REFERENCES [regioesIntermediarias]([regIntID])
go

ALTER TABLE [regioesImediatasRegiaoIntermediaria] ADD CONSTRAINT [regIntFkRegImeRegInt] 
    FOREIGN KEY ([regImeID])
    REFERENCES [regioesImediatas]([regImeID])
go


/* 
 * TABLE: [regioesIntermediariasUnidadeFederacao] 
 */

ALTER TABLE [regioesIntermediariasUnidadeFederacao] ADD CONSTRAINT [regIntFkRegIntUniFed] 
    FOREIGN KEY ([regIntID])
    REFERENCES [regioesIntermediarias]([regIntID])
go

ALTER TABLE [regioesIntermediariasUnidadeFederacao] ADD CONSTRAINT [uniFedFkRegIntUniFed] 
    FOREIGN KEY ([uniFedID])
    REFERENCES [unidadesFederacao]([uniFedID])
go


/* 
 * TABLE: [regioesNacoes] 
 */

ALTER TABLE [regioesNacoes] ADD CONSTRAINT [regNacFkNac] 
    FOREIGN KEY ([nacID])
    REFERENCES [nacoes]([nacID])
go

ALTER TABLE [regioesNacoes] ADD CONSTRAINT [regNacFkReg] 
    FOREIGN KEY ([regID])
    REFERENCES [regiao]([regID])
go


/* 
 * TABLE: [regioesSubRegioes] 
 */

ALTER TABLE [regioesSubRegioes] ADD CONSTRAINT [subRegRegFkSubReg] 
    FOREIGN KEY ([subRegID])
    REFERENCES [subRegioes]([subRegID])
go

ALTER TABLE [regioesSubRegioes] ADD CONSTRAINT [sugRegRegFkReg] 
    FOREIGN KEY ([regID])
    REFERENCES [regioes]([regID])
go


/* 
 * TABLE: [setoresSubRegioes] 
 */

ALTER TABLE [setoresSubRegioes] ADD CONSTRAINT [setSubRegFkSet] 
    FOREIGN KEY ([setID])
    REFERENCES [setores]([setID])
go

ALTER TABLE [setoresSubRegioes] ADD CONSTRAINT [setSubRegFkSubReg] 
    FOREIGN KEY ([subRegID])
    REFERENCES [subRegioes]([subRegID])
go


/* 
 * TABLE: [setoresSubSetores] 
 */

ALTER TABLE [setoresSubSetores] ADD CONSTRAINT [subSetSetFkSet] 
    FOREIGN KEY ([setID])
    REFERENCES [setores]([setID])
go

ALTER TABLE [setoresSubSetores] ADD CONSTRAINT [subSetSetFkSubSet] 
    FOREIGN KEY ([subSetID])
    REFERENCES [subSetores]([subSetID])
go


/* 
 * TABLE: [subDistritosDistrito] 
 */

ALTER TABLE [subDistritosDistrito] ADD CONSTRAINT [disFkSubDisDis] 
    FOREIGN KEY ([disID])
    REFERENCES [distritos]([disID])
go

ALTER TABLE [subDistritosDistrito] ADD CONSTRAINT [subDisFkSubDisDis] 
    FOREIGN KEY ([subDisID])
    REFERENCES [subDistritos]([subDisID])
go


/* 
 * TABLE: [subDistritosMunicipio] 
 */

ALTER TABLE [subDistritosMunicipio] ADD CONSTRAINT [munFkSubDisMun] 
    FOREIGN KEY ([munID])
    REFERENCES [municipios]([munID])
go

ALTER TABLE [subDistritosMunicipio] ADD CONSTRAINT [subDisFkSubDisMun] 
    FOREIGN KEY ([subDisID])
    REFERENCES [subDistritos]([subDisID])
go


/* 
 * TABLE: [subRegioesRegioes] 
 */

ALTER TABLE [subRegioesRegioes] ADD CONSTRAINT [regFkSubRegReg] 
    FOREIGN KEY ([regID])
    REFERENCES [regioes]([regID])
go

ALTER TABLE [subRegioesRegioes] ADD CONSTRAINT [subRegFkSubRegReg] 
    FOREIGN KEY ([subRegID])
    REFERENCES [subRegioes]([subRegID])
go


/* 
 * TABLE: [subSetorDivisoesSubSetores] 
 */

ALTER TABLE [subSetorDivisoesSubSetores] ADD CONSTRAINT [subSetDivSubSetFkSubSet] 
    FOREIGN KEY ([subSetID])
    REFERENCES [subSetores]([subSetID])
go

ALTER TABLE [subSetorDivisoesSubSetores] ADD CONSTRAINT [subSetDivSubSetFkSubSetDiv] 
    FOREIGN KEY ([subSetDivID])
    REFERENCES [subSetorDivisoes]([subSetDivID])
go


/* 
 * TABLE: [sufixosTiposSufixos] 
 */

ALTER TABLE [sufixosTiposSufixos] ADD CONSTRAINT [sufTipSufFkSuf] 
    FOREIGN KEY ([sufID])
    REFERENCES [sufixos]([sufID])
go

ALTER TABLE [sufixosTiposSufixos] ADD CONSTRAINT [sufTipSufFkSufTip] 
    FOREIGN KEY ([sufTipID])
    REFERENCES [sufixosTipos]([sufTipID])
go


/* 
 * TABLE: [unidadesFederacaoRegiao] 
 */

ALTER TABLE [unidadesFederacaoRegiao] ADD CONSTRAINT [regFkUniFedReg] 
    FOREIGN KEY ([regID])
    REFERENCES [regiao]([regID])
go

ALTER TABLE [unidadesFederacaoRegiao] ADD CONSTRAINT [uniFedFkUniFedReg] 
    FOREIGN KEY ([uniFedID])
    REFERENCES [unidadesFederacao]([uniFedID])
go


