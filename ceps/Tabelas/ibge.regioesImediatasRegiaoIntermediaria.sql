IF OBJECT_ID('[ibge].[regioesImediatasRegiaoIntermediaria]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[regioesImediatasRegiaoIntermediaria]
    PRINT '<<< DROPPED TABLE [ibge].[regioesImediatasRegiaoIntermediaria] >>>'
END
go
/* 
 * TABLE: [ibge].[regioesImediatasRegiaoIntermediaria] 
 */

CREATE TABLE [ibge].[regioesImediatasRegiaoIntermediaria](
    [regImeRegIntID]  int    IDENTITY(1,1),
    [regIntID]        int    NOT NULL,
    [regImeID]        int    NOT NULL
)
go



IF OBJECT_ID('ibge.regioesImediatasRegiaoIntermediaria') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.regioesImediatasRegiaoIntermediaria >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.regioesImediatasRegiaoIntermediaria >>>'
go

/* 
 * TABLE: [ibge].[regioesImediatasRegiaoIntermediaria] 
 */

ALTER TABLE [ibge].[regioesImediatasRegiaoIntermediaria] ADD 
    CONSTRAINT [regImeRegIntIxPk] PRIMARY KEY CLUSTERED ([regImeRegIntID])
go

IF OBJECT_ID('ibge.regioesImediatasRegiaoIntermediaria') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.regioesImediatasRegiaoIntermediaria >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.regioesImediatasRegiaoIntermediaria >>>'
go

/* 
 * INDEX: [regImeRegIntIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesImediatasRegiaoIntermediaria') AND name='regImeRegIntIxAk')
BEGIN
    DROP INDEX [ibge].[regioesImediatasRegiaoIntermediaria].[regImeRegIntIxAk]
    PRINT '<<< DROPPED INDEX [ibge].[regioesImediatasRegiaoIntermediaria].[regImeRegIntIxAk] >>>'
END
go

/* 
 * INDEX: [regImeRegIntIxFkRegInt] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesImediatasRegiaoIntermediaria') AND name='regImeRegIntIxFkRegInt')
BEGIN
    DROP INDEX [ibge].[regioesImediatasRegiaoIntermediaria].[regImeRegIntIxFkRegInt]
    PRINT '<<< DROPPED INDEX [ibge].[regioesImediatasRegiaoIntermediaria].[regImeRegIntIxFkRegInt] >>>'
END
go

/* 
 * INDEX: [regImeRegIntIxFkRegIme] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesImediatasRegiaoIntermediaria') AND name='regImeRegIntIxFkRegIme')
BEGIN
    DROP INDEX [ibge].[regioesImediatasRegiaoIntermediaria].[regImeRegIntIxFkRegIme]
    PRINT '<<< DROPPED INDEX [ibge].[regioesImediatasRegiaoIntermediaria].[regImeRegIntIxFkRegIme] >>>'
END
go

/* 
 * INDEX: [regIntFkRegImeRegInt] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesImediatasRegiaoIntermediaria') AND name='regIntFkRegImeRegInt')
BEGIN
    DROP INDEX [ibge].[regioesImediatasRegiaoIntermediaria].[regIntFkRegImeRegInt]
    PRINT '<<< DROPPED INDEX [ibge].[regioesImediatasRegiaoIntermediaria].[regIntFkRegImeRegInt] >>>'
END
go

/* 
 * INDEX: [regImeRegIntIxAk] 
 */

CREATE UNIQUE INDEX [regImeRegIntIxAk] ON [ibge].[regioesImediatasRegiaoIntermediaria]([regIntID], [regImeID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesImediatasRegiaoIntermediaria') AND name='regImeRegIntIxAk')
    PRINT '<<< CREATED INDEX ibge.regioesImediatasRegiaoIntermediaria.regImeRegIntIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.regioesImediatasRegiaoIntermediaria.regImeRegIntIxAk >>>'
go

/* 
 * INDEX: [regImeRegIntIxFkRegInt] 
 */

CREATE INDEX [regImeRegIntIxFkRegInt] ON [ibge].[regioesImediatasRegiaoIntermediaria]([regIntID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesImediatasRegiaoIntermediaria') AND name='regImeRegIntIxFkRegInt')
    PRINT '<<< CREATED INDEX ibge.regioesImediatasRegiaoIntermediaria.regImeRegIntIxFkRegInt >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.regioesImediatasRegiaoIntermediaria.regImeRegIntIxFkRegInt >>>'
go

/* 
 * INDEX: [regImeRegIntIxFkRegIme] 
 */

CREATE INDEX [regImeRegIntIxFkRegIme] ON [ibge].[regioesImediatasRegiaoIntermediaria]([regImeID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesImediatasRegiaoIntermediaria') AND name='regImeRegIntIxFkRegIme')
    PRINT '<<< CREATED INDEX ibge.regioesImediatasRegiaoIntermediaria.regImeRegIntIxFkRegIme >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.regioesImediatasRegiaoIntermediaria.regImeRegIntIxFkRegIme >>>'
go

/* 
 * INDEX: [regIntFkRegImeRegInt] 
 */

CREATE INDEX [regIntFkRegImeRegInt] ON [ibge].[regioesImediatasRegiaoIntermediaria]([regIntID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesImediatasRegiaoIntermediaria') AND name='regIntFkRegImeRegInt')
    PRINT '<<< CREATED INDEX ibge.regioesImediatasRegiaoIntermediaria.regIntFkRegImeRegInt >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.regioesImediatasRegiaoIntermediaria.regIntFkRegImeRegInt >>>'
go

