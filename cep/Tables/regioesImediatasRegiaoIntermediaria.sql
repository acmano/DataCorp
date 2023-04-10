IF OBJECT_ID('[regioesImediatasRegiaoIntermediaria]') IS NOT NULL
BEGIN
    DROP TABLE [regioesImediatasRegiaoIntermediaria]
    PRINT '<<< DROPPED TABLE [regioesImediatasRegiaoIntermediaria] >>>'
END
go
/* 
 * TABLE: [regioesImediatasRegiaoIntermediaria] 
 */

CREATE TABLE [regioesImediatasRegiaoIntermediaria](
    [regImeRegIntID]  int    IDENTITY(1,1),
    [regIntID]        int    NOT NULL,
    [regImeID]        int    NOT NULL
)
go



IF OBJECT_ID('regioesImediatasRegiaoIntermediaria') IS NOT NULL
    PRINT '<<< CREATED TABLE regioesImediatasRegiaoIntermediaria >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE regioesImediatasRegiaoIntermediaria >>>'
go

/* 
 * TABLE: [regioesImediatasRegiaoIntermediaria] 
 */

ALTER TABLE [regioesImediatasRegiaoIntermediaria] ADD 
    CONSTRAINT [regImeRegIntIxPk] PRIMARY KEY CLUSTERED ([regImeRegIntID])
go

IF OBJECT_ID('regioesImediatasRegiaoIntermediaria') IS NOT NULL
    PRINT '<<< CREATED TABLE regioesImediatasRegiaoIntermediaria >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE regioesImediatasRegiaoIntermediaria >>>'
go

/* 
 * INDEX: [regImeRegIntIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesImediatasRegiaoIntermediaria') AND name='regImeRegIntIxAk')
BEGIN
    DROP INDEX [regioesImediatasRegiaoIntermediaria].[regImeRegIntIxAk]
    PRINT '<<< DROPPED INDEX [regioesImediatasRegiaoIntermediaria].[regImeRegIntIxAk] >>>'
END
go

/* 
 * INDEX: [regImeRegIntIxFkRegInt] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesImediatasRegiaoIntermediaria') AND name='regImeRegIntIxFkRegInt')
BEGIN
    DROP INDEX [regioesImediatasRegiaoIntermediaria].[regImeRegIntIxFkRegInt]
    PRINT '<<< DROPPED INDEX [regioesImediatasRegiaoIntermediaria].[regImeRegIntIxFkRegInt] >>>'
END
go

/* 
 * INDEX: [regImeRegIntIxFkRegIme] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesImediatasRegiaoIntermediaria') AND name='regImeRegIntIxFkRegIme')
BEGIN
    DROP INDEX [regioesImediatasRegiaoIntermediaria].[regImeRegIntIxFkRegIme]
    PRINT '<<< DROPPED INDEX [regioesImediatasRegiaoIntermediaria].[regImeRegIntIxFkRegIme] >>>'
END
go

/* 
 * INDEX: [regIntFkRegImeRegInt] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesImediatasRegiaoIntermediaria') AND name='regIntFkRegImeRegInt')
BEGIN
    DROP INDEX [regioesImediatasRegiaoIntermediaria].[regIntFkRegImeRegInt]
    PRINT '<<< DROPPED INDEX [regioesImediatasRegiaoIntermediaria].[regIntFkRegImeRegInt] >>>'
END
go

/* 
 * INDEX: [regImeRegIntIxAk] 
 */

CREATE UNIQUE INDEX [regImeRegIntIxAk] ON [regioesImediatasRegiaoIntermediaria]([regIntID], [regImeID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesImediatasRegiaoIntermediaria') AND name='regImeRegIntIxAk')
    PRINT '<<< CREATED INDEX regioesImediatasRegiaoIntermediaria.regImeRegIntIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX regioesImediatasRegiaoIntermediaria.regImeRegIntIxAk >>>'
go

/* 
 * INDEX: [regImeRegIntIxFkRegInt] 
 */

CREATE INDEX [regImeRegIntIxFkRegInt] ON [regioesImediatasRegiaoIntermediaria]([regIntID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesImediatasRegiaoIntermediaria') AND name='regImeRegIntIxFkRegInt')
    PRINT '<<< CREATED INDEX regioesImediatasRegiaoIntermediaria.regImeRegIntIxFkRegInt >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX regioesImediatasRegiaoIntermediaria.regImeRegIntIxFkRegInt >>>'
go

/* 
 * INDEX: [regImeRegIntIxFkRegIme] 
 */

CREATE INDEX [regImeRegIntIxFkRegIme] ON [regioesImediatasRegiaoIntermediaria]([regImeID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesImediatasRegiaoIntermediaria') AND name='regImeRegIntIxFkRegIme')
    PRINT '<<< CREATED INDEX regioesImediatasRegiaoIntermediaria.regImeRegIntIxFkRegIme >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX regioesImediatasRegiaoIntermediaria.regImeRegIntIxFkRegIme >>>'
go

/* 
 * INDEX: [regIntFkRegImeRegInt] 
 */

CREATE INDEX [regIntFkRegImeRegInt] ON [regioesImediatasRegiaoIntermediaria]([regIntID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesImediatasRegiaoIntermediaria') AND name='regIntFkRegImeRegInt')
    PRINT '<<< CREATED INDEX regioesImediatasRegiaoIntermediaria.regIntFkRegImeRegInt >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX regioesImediatasRegiaoIntermediaria.regIntFkRegImeRegInt >>>'
go

