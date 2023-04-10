IF OBJECT_ID('[geo].[nacoesContinentes]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[nacoesContinentes]
    PRINT '<<< DROPPED TABLE [geo].[nacoesContinentes] >>>'
END
go
/* 
 * TABLE: [geo].[nacoesContinentes] 
 */

CREATE TABLE [geo].[nacoesContinentes](
    [nacCntID]  int    IDENTITY(1,1),
    [nacID]     int    NOT NULL,
    [ctnID]     int    NOT NULL
)
go



IF OBJECT_ID('geo.nacoesContinentes') IS NOT NULL
    PRINT '<<< CREATED TABLE geo.nacoesContinentes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE geo.nacoesContinentes >>>'
go

/* 
 * TABLE: [geo].[nacoesContinentes] 
 */

ALTER TABLE [geo].[nacoesContinentes] ADD 
    CONSTRAINT [nacCntIxPk] PRIMARY KEY CLUSTERED ([nacCntID])
go

IF OBJECT_ID('geo.nacoesContinentes') IS NOT NULL
    PRINT '<<< CREATED TABLE geo.nacoesContinentes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE geo.nacoesContinentes >>>'
go

/* 
 * INDEX: [nacCntIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesContinentes') AND name='nacCntIxAk')
BEGIN
    DROP INDEX [geo].[nacoesContinentes].[nacCntIxAk]
    PRINT '<<< DROPPED INDEX [geo].[nacoesContinentes].[nacCntIxAk] >>>'
END
go

/* 
 * INDEX: [nacCntIxFkNac] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesContinentes') AND name='nacCntIxFkNac')
BEGIN
    DROP INDEX [geo].[nacoesContinentes].[nacCntIxFkNac]
    PRINT '<<< DROPPED INDEX [geo].[nacoesContinentes].[nacCntIxFkNac] >>>'
END
go

/* 
 * INDEX: [nacFkNacCtn] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesContinentes') AND name='nacFkNacCtn')
BEGIN
    DROP INDEX [geo].[nacoesContinentes].[nacFkNacCtn]
    PRINT '<<< DROPPED INDEX [geo].[nacoesContinentes].[nacFkNacCtn] >>>'
END
go

/* 
 * INDEX: [ctnFkNacCtn] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesContinentes') AND name='ctnFkNacCtn')
BEGIN
    DROP INDEX [geo].[nacoesContinentes].[ctnFkNacCtn]
    PRINT '<<< DROPPED INDEX [geo].[nacoesContinentes].[ctnFkNacCtn] >>>'
END
go

/* 
 * INDEX: [nacCntIxAk] 
 */

CREATE UNIQUE INDEX [nacCntIxAk] ON [geo].[nacoesContinentes]([ctnID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesContinentes') AND name='nacCntIxAk')
    PRINT '<<< CREATED INDEX geo.nacoesContinentes.nacCntIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.nacoesContinentes.nacCntIxAk >>>'
go

/* 
 * INDEX: [nacCntIxFkNac] 
 */

CREATE INDEX [nacCntIxFkNac] ON [geo].[nacoesContinentes]([nacID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesContinentes') AND name='nacCntIxFkNac')
    PRINT '<<< CREATED INDEX geo.nacoesContinentes.nacCntIxFkNac >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.nacoesContinentes.nacCntIxFkNac >>>'
go

/* 
 * INDEX: [nacFkNacCtn] 
 */

CREATE INDEX [nacFkNacCtn] ON [geo].[nacoesContinentes]([nacID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesContinentes') AND name='nacFkNacCtn')
    PRINT '<<< CREATED INDEX geo.nacoesContinentes.nacFkNacCtn >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.nacoesContinentes.nacFkNacCtn >>>'
go

/* 
 * INDEX: [ctnFkNacCtn] 
 */

CREATE INDEX [ctnFkNacCtn] ON [geo].[nacoesContinentes]([ctnID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesContinentes') AND name='ctnFkNacCtn')
    PRINT '<<< CREATED INDEX geo.nacoesContinentes.ctnFkNacCtn >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.nacoesContinentes.ctnFkNacCtn >>>'
go

