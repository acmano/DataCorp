IF OBJECT_ID('[ibge].[mesoRegioesUnidadeFederacao]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[mesoRegioesUnidadeFederacao]
    PRINT '<<< DROPPED TABLE [ibge].[mesoRegioesUnidadeFederacao] >>>'
END
go
/* 
 * TABLE: [ibge].[mesoRegioesUnidadeFederacao] 
 */

CREATE TABLE [ibge].[mesoRegioesUnidadeFederacao](
    [mesRegUniFedID]  int    IDENTITY(1,1),
    [uniFedID]        int    NOT NULL,
    [mesRegID]        int    NOT NULL
)
go



IF OBJECT_ID('ibge.mesoRegioesUnidadeFederacao') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.mesoRegioesUnidadeFederacao >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.mesoRegioesUnidadeFederacao >>>'
go

/* 
 * TABLE: [ibge].[mesoRegioesUnidadeFederacao] 
 */

ALTER TABLE [ibge].[mesoRegioesUnidadeFederacao] ADD 
    CONSTRAINT [msRegUniFedIxPk] PRIMARY KEY CLUSTERED ([mesRegUniFedID])
go

IF OBJECT_ID('ibge.mesoRegioesUnidadeFederacao') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.mesoRegioesUnidadeFederacao >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.mesoRegioesUnidadeFederacao >>>'
go

/* 
 * INDEX: [mesRegUniFedIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.mesoRegioesUnidadeFederacao') AND name='mesRegUniFedIxAk')
BEGIN
    DROP INDEX [ibge].[mesoRegioesUnidadeFederacao].[mesRegUniFedIxAk]
    PRINT '<<< DROPPED INDEX [ibge].[mesoRegioesUnidadeFederacao].[mesRegUniFedIxAk] >>>'
END
go

/* 
 * INDEX: [mesRegIxFkUniFed] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.mesoRegioesUnidadeFederacao') AND name='mesRegIxFkUniFed')
BEGIN
    DROP INDEX [ibge].[mesoRegioesUnidadeFederacao].[mesRegIxFkUniFed]
    PRINT '<<< DROPPED INDEX [ibge].[mesoRegioesUnidadeFederacao].[mesRegIxFkUniFed] >>>'
END
go

/* 
 * INDEX: [mesRegIxFkMesReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.mesoRegioesUnidadeFederacao') AND name='mesRegIxFkMesReg')
BEGIN
    DROP INDEX [ibge].[mesoRegioesUnidadeFederacao].[mesRegIxFkMesReg]
    PRINT '<<< DROPPED INDEX [ibge].[mesoRegioesUnidadeFederacao].[mesRegIxFkMesReg] >>>'
END
go

/* 
 * INDEX: [uniFedFkMesRegUniFed] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.mesoRegioesUnidadeFederacao') AND name='uniFedFkMesRegUniFed')
BEGIN
    DROP INDEX [ibge].[mesoRegioesUnidadeFederacao].[uniFedFkMesRegUniFed]
    PRINT '<<< DROPPED INDEX [ibge].[mesoRegioesUnidadeFederacao].[uniFedFkMesRegUniFed] >>>'
END
go

/* 
 * INDEX: [mesRegFkMesRegUniFed] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.mesoRegioesUnidadeFederacao') AND name='mesRegFkMesRegUniFed')
BEGIN
    DROP INDEX [ibge].[mesoRegioesUnidadeFederacao].[mesRegFkMesRegUniFed]
    PRINT '<<< DROPPED INDEX [ibge].[mesoRegioesUnidadeFederacao].[mesRegFkMesRegUniFed] >>>'
END
go

/* 
 * INDEX: [mesRegUniFedIxAk] 
 */

CREATE UNIQUE INDEX [mesRegUniFedIxAk] ON [ibge].[mesoRegioesUnidadeFederacao]([uniFedID], [mesRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.mesoRegioesUnidadeFederacao') AND name='mesRegUniFedIxAk')
    PRINT '<<< CREATED INDEX ibge.mesoRegioesUnidadeFederacao.mesRegUniFedIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.mesoRegioesUnidadeFederacao.mesRegUniFedIxAk >>>'
go

/* 
 * INDEX: [mesRegIxFkUniFed] 
 */

CREATE INDEX [mesRegIxFkUniFed] ON [ibge].[mesoRegioesUnidadeFederacao]([uniFedID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.mesoRegioesUnidadeFederacao') AND name='mesRegIxFkUniFed')
    PRINT '<<< CREATED INDEX ibge.mesoRegioesUnidadeFederacao.mesRegIxFkUniFed >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.mesoRegioesUnidadeFederacao.mesRegIxFkUniFed >>>'
go

/* 
 * INDEX: [mesRegIxFkMesReg] 
 */

CREATE INDEX [mesRegIxFkMesReg] ON [ibge].[mesoRegioesUnidadeFederacao]([mesRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.mesoRegioesUnidadeFederacao') AND name='mesRegIxFkMesReg')
    PRINT '<<< CREATED INDEX ibge.mesoRegioesUnidadeFederacao.mesRegIxFkMesReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.mesoRegioesUnidadeFederacao.mesRegIxFkMesReg >>>'
go

/* 
 * INDEX: [uniFedFkMesRegUniFed] 
 */

CREATE INDEX [uniFedFkMesRegUniFed] ON [ibge].[mesoRegioesUnidadeFederacao]([uniFedID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.mesoRegioesUnidadeFederacao') AND name='uniFedFkMesRegUniFed')
    PRINT '<<< CREATED INDEX ibge.mesoRegioesUnidadeFederacao.uniFedFkMesRegUniFed >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.mesoRegioesUnidadeFederacao.uniFedFkMesRegUniFed >>>'
go

/* 
 * INDEX: [mesRegFkMesRegUniFed] 
 */

CREATE INDEX [mesRegFkMesRegUniFed] ON [ibge].[mesoRegioesUnidadeFederacao]([mesRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.mesoRegioesUnidadeFederacao') AND name='mesRegFkMesRegUniFed')
    PRINT '<<< CREATED INDEX ibge.mesoRegioesUnidadeFederacao.mesRegFkMesRegUniFed >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.mesoRegioesUnidadeFederacao.mesRegFkMesRegUniFed >>>'
go

