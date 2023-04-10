IF OBJECT_ID('[regioesIntermediariasUnidadeFederacao]') IS NOT NULL
BEGIN
    DROP TABLE [regioesIntermediariasUnidadeFederacao]
    PRINT '<<< DROPPED TABLE [regioesIntermediariasUnidadeFederacao] >>>'
END
go
/* 
 * TABLE: [regioesIntermediariasUnidadeFederacao] 
 */

CREATE TABLE [regioesIntermediariasUnidadeFederacao](
    [regIntUniFedID]  int    IDENTITY(1,1),
    [uniFedID]        int    NOT NULL,
    [regIntID]        int    NOT NULL
)
go



IF OBJECT_ID('regioesIntermediariasUnidadeFederacao') IS NOT NULL
    PRINT '<<< CREATED TABLE regioesIntermediariasUnidadeFederacao >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE regioesIntermediariasUnidadeFederacao >>>'
go

/* 
 * TABLE: [regioesIntermediariasUnidadeFederacao] 
 */

ALTER TABLE [regioesIntermediariasUnidadeFederacao] ADD 
    CONSTRAINT [regIntUniFedIxPk] PRIMARY KEY CLUSTERED ([regIntUniFedID])
go

IF OBJECT_ID('regioesIntermediariasUnidadeFederacao') IS NOT NULL
    PRINT '<<< CREATED TABLE regioesIntermediariasUnidadeFederacao >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE regioesIntermediariasUnidadeFederacao >>>'
go

/* 
 * INDEX: [regIntUniFedIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesIntermediariasUnidadeFederacao') AND name='regIntUniFedIxAk')
BEGIN
    DROP INDEX [regioesIntermediariasUnidadeFederacao].[regIntUniFedIxAk]
    PRINT '<<< DROPPED INDEX [regioesIntermediariasUnidadeFederacao].[regIntUniFedIxAk] >>>'
END
go

/* 
 * INDEX: [regIntUniFedIxFkUniFed] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesIntermediariasUnidadeFederacao') AND name='regIntUniFedIxFkUniFed')
BEGIN
    DROP INDEX [regioesIntermediariasUnidadeFederacao].[regIntUniFedIxFkUniFed]
    PRINT '<<< DROPPED INDEX [regioesIntermediariasUnidadeFederacao].[regIntUniFedIxFkUniFed] >>>'
END
go

/* 
 * INDEX: [regIntUniFedIxFkRegInt] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesIntermediariasUnidadeFederacao') AND name='regIntUniFedIxFkRegInt')
BEGIN
    DROP INDEX [regioesIntermediariasUnidadeFederacao].[regIntUniFedIxFkRegInt]
    PRINT '<<< DROPPED INDEX [regioesIntermediariasUnidadeFederacao].[regIntUniFedIxFkRegInt] >>>'
END
go

/* 
 * INDEX: [uniFedFkRegIntUniFed] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesIntermediariasUnidadeFederacao') AND name='uniFedFkRegIntUniFed')
BEGIN
    DROP INDEX [regioesIntermediariasUnidadeFederacao].[uniFedFkRegIntUniFed]
    PRINT '<<< DROPPED INDEX [regioesIntermediariasUnidadeFederacao].[uniFedFkRegIntUniFed] >>>'
END
go

/* 
 * INDEX: [regIntFkRegIntUniFed] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesIntermediariasUnidadeFederacao') AND name='regIntFkRegIntUniFed')
BEGIN
    DROP INDEX [regioesIntermediariasUnidadeFederacao].[regIntFkRegIntUniFed]
    PRINT '<<< DROPPED INDEX [regioesIntermediariasUnidadeFederacao].[regIntFkRegIntUniFed] >>>'
END
go

/* 
 * INDEX: [regIntUniFedIxAk] 
 */

CREATE UNIQUE INDEX [regIntUniFedIxAk] ON [regioesIntermediariasUnidadeFederacao]([uniFedID], [regIntID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesIntermediariasUnidadeFederacao') AND name='regIntUniFedIxAk')
    PRINT '<<< CREATED INDEX regioesIntermediariasUnidadeFederacao.regIntUniFedIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX regioesIntermediariasUnidadeFederacao.regIntUniFedIxAk >>>'
go

/* 
 * INDEX: [regIntUniFedIxFkUniFed] 
 */

CREATE INDEX [regIntUniFedIxFkUniFed] ON [regioesIntermediariasUnidadeFederacao]([uniFedID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesIntermediariasUnidadeFederacao') AND name='regIntUniFedIxFkUniFed')
    PRINT '<<< CREATED INDEX regioesIntermediariasUnidadeFederacao.regIntUniFedIxFkUniFed >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX regioesIntermediariasUnidadeFederacao.regIntUniFedIxFkUniFed >>>'
go

/* 
 * INDEX: [regIntUniFedIxFkRegInt] 
 */

CREATE INDEX [regIntUniFedIxFkRegInt] ON [regioesIntermediariasUnidadeFederacao]([regIntID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesIntermediariasUnidadeFederacao') AND name='regIntUniFedIxFkRegInt')
    PRINT '<<< CREATED INDEX regioesIntermediariasUnidadeFederacao.regIntUniFedIxFkRegInt >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX regioesIntermediariasUnidadeFederacao.regIntUniFedIxFkRegInt >>>'
go

/* 
 * INDEX: [uniFedFkRegIntUniFed] 
 */

CREATE INDEX [uniFedFkRegIntUniFed] ON [regioesIntermediariasUnidadeFederacao]([uniFedID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesIntermediariasUnidadeFederacao') AND name='uniFedFkRegIntUniFed')
    PRINT '<<< CREATED INDEX regioesIntermediariasUnidadeFederacao.uniFedFkRegIntUniFed >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX regioesIntermediariasUnidadeFederacao.uniFedFkRegIntUniFed >>>'
go

/* 
 * INDEX: [regIntFkRegIntUniFed] 
 */

CREATE INDEX [regIntFkRegIntUniFed] ON [regioesIntermediariasUnidadeFederacao]([regIntID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesIntermediariasUnidadeFederacao') AND name='regIntFkRegIntUniFed')
    PRINT '<<< CREATED INDEX regioesIntermediariasUnidadeFederacao.regIntFkRegIntUniFed >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX regioesIntermediariasUnidadeFederacao.regIntFkRegIntUniFed >>>'
go

