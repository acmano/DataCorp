IF OBJECT_ID('[ibge].[regioesIntermediariasUnidadeFederacao]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[regioesIntermediariasUnidadeFederacao]
    PRINT '<<< DROPPED TABLE [ibge].[regioesIntermediariasUnidadeFederacao] >>>'
END
go
/* 
 * TABLE: [ibge].[regioesIntermediariasUnidadeFederacao] 
 */

CREATE TABLE [ibge].[regioesIntermediariasUnidadeFederacao](
    [regIntUniFedID]  int    IDENTITY(1,1),
    [uniFedID]        int    NOT NULL,
    [regIntID]        int    NOT NULL
)
go



IF OBJECT_ID('ibge.regioesIntermediariasUnidadeFederacao') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.regioesIntermediariasUnidadeFederacao >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.regioesIntermediariasUnidadeFederacao >>>'
go

/* 
 * TABLE: [ibge].[regioesIntermediariasUnidadeFederacao] 
 */

ALTER TABLE [ibge].[regioesIntermediariasUnidadeFederacao] ADD 
    CONSTRAINT [regIntUniFedIxPk] PRIMARY KEY CLUSTERED ([regIntUniFedID])
go

IF OBJECT_ID('ibge.regioesIntermediariasUnidadeFederacao') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.regioesIntermediariasUnidadeFederacao >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.regioesIntermediariasUnidadeFederacao >>>'
go

/* 
 * INDEX: [regIntUniFedIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesIntermediariasUnidadeFederacao') AND name='regIntUniFedIxAk')
BEGIN
    DROP INDEX [ibge].[regioesIntermediariasUnidadeFederacao].[regIntUniFedIxAk]
    PRINT '<<< DROPPED INDEX [ibge].[regioesIntermediariasUnidadeFederacao].[regIntUniFedIxAk] >>>'
END
go

/* 
 * INDEX: [regIntUniFedIxFkUniFed] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesIntermediariasUnidadeFederacao') AND name='regIntUniFedIxFkUniFed')
BEGIN
    DROP INDEX [ibge].[regioesIntermediariasUnidadeFederacao].[regIntUniFedIxFkUniFed]
    PRINT '<<< DROPPED INDEX [ibge].[regioesIntermediariasUnidadeFederacao].[regIntUniFedIxFkUniFed] >>>'
END
go

/* 
 * INDEX: [regIntUniFedIxFkRegInt] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesIntermediariasUnidadeFederacao') AND name='regIntUniFedIxFkRegInt')
BEGIN
    DROP INDEX [ibge].[regioesIntermediariasUnidadeFederacao].[regIntUniFedIxFkRegInt]
    PRINT '<<< DROPPED INDEX [ibge].[regioesIntermediariasUnidadeFederacao].[regIntUniFedIxFkRegInt] >>>'
END
go

/* 
 * INDEX: [uniFedFkRegIntUniFed] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesIntermediariasUnidadeFederacao') AND name='uniFedFkRegIntUniFed')
BEGIN
    DROP INDEX [ibge].[regioesIntermediariasUnidadeFederacao].[uniFedFkRegIntUniFed]
    PRINT '<<< DROPPED INDEX [ibge].[regioesIntermediariasUnidadeFederacao].[uniFedFkRegIntUniFed] >>>'
END
go

/* 
 * INDEX: [regIntFkRegIntUniFed] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesIntermediariasUnidadeFederacao') AND name='regIntFkRegIntUniFed')
BEGIN
    DROP INDEX [ibge].[regioesIntermediariasUnidadeFederacao].[regIntFkRegIntUniFed]
    PRINT '<<< DROPPED INDEX [ibge].[regioesIntermediariasUnidadeFederacao].[regIntFkRegIntUniFed] >>>'
END
go

/* 
 * INDEX: [regIntUniFedIxAk] 
 */

CREATE UNIQUE INDEX [regIntUniFedIxAk] ON [ibge].[regioesIntermediariasUnidadeFederacao]([uniFedID], [regIntID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesIntermediariasUnidadeFederacao') AND name='regIntUniFedIxAk')
    PRINT '<<< CREATED INDEX ibge.regioesIntermediariasUnidadeFederacao.regIntUniFedIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.regioesIntermediariasUnidadeFederacao.regIntUniFedIxAk >>>'
go

/* 
 * INDEX: [regIntUniFedIxFkUniFed] 
 */

CREATE INDEX [regIntUniFedIxFkUniFed] ON [ibge].[regioesIntermediariasUnidadeFederacao]([uniFedID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesIntermediariasUnidadeFederacao') AND name='regIntUniFedIxFkUniFed')
    PRINT '<<< CREATED INDEX ibge.regioesIntermediariasUnidadeFederacao.regIntUniFedIxFkUniFed >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.regioesIntermediariasUnidadeFederacao.regIntUniFedIxFkUniFed >>>'
go

/* 
 * INDEX: [regIntUniFedIxFkRegInt] 
 */

CREATE INDEX [regIntUniFedIxFkRegInt] ON [ibge].[regioesIntermediariasUnidadeFederacao]([regIntID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesIntermediariasUnidadeFederacao') AND name='regIntUniFedIxFkRegInt')
    PRINT '<<< CREATED INDEX ibge.regioesIntermediariasUnidadeFederacao.regIntUniFedIxFkRegInt >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.regioesIntermediariasUnidadeFederacao.regIntUniFedIxFkRegInt >>>'
go

/* 
 * INDEX: [uniFedFkRegIntUniFed] 
 */

CREATE INDEX [uniFedFkRegIntUniFed] ON [ibge].[regioesIntermediariasUnidadeFederacao]([uniFedID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesIntermediariasUnidadeFederacao') AND name='uniFedFkRegIntUniFed')
    PRINT '<<< CREATED INDEX ibge.regioesIntermediariasUnidadeFederacao.uniFedFkRegIntUniFed >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.regioesIntermediariasUnidadeFederacao.uniFedFkRegIntUniFed >>>'
go

/* 
 * INDEX: [regIntFkRegIntUniFed] 
 */

CREATE INDEX [regIntFkRegIntUniFed] ON [ibge].[regioesIntermediariasUnidadeFederacao]([regIntID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesIntermediariasUnidadeFederacao') AND name='regIntFkRegIntUniFed')
    PRINT '<<< CREATED INDEX ibge.regioesIntermediariasUnidadeFederacao.regIntFkRegIntUniFed >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.regioesIntermediariasUnidadeFederacao.regIntFkRegIntUniFed >>>'
go

