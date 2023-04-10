IF OBJECT_ID('[nacoesContinentes]') IS NOT NULL
BEGIN
    DROP TABLE [nacoesContinentes]
    PRINT '<<< DROPPED TABLE [nacoesContinentes] >>>'
END
go
/* 
 * TABLE: [nacoesContinentes] 
 */

CREATE TABLE [nacoesContinentes](
    [nacCntID]  int    IDENTITY(1,1),
    [nacID]     int    NOT NULL,
    [ctnID]     int    NOT NULL
)
go



IF OBJECT_ID('nacoesContinentes') IS NOT NULL
    PRINT '<<< CREATED TABLE nacoesContinentes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE nacoesContinentes >>>'
go

/* 
 * TABLE: [nacoesContinentes] 
 */

ALTER TABLE [nacoesContinentes] ADD 
    CONSTRAINT [nacCntIxPk] PRIMARY KEY CLUSTERED ([nacCntID])
go

IF OBJECT_ID('nacoesContinentes') IS NOT NULL
    PRINT '<<< CREATED TABLE nacoesContinentes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE nacoesContinentes >>>'
go

/* 
 * INDEX: [nacCntIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesContinentes') AND name='nacCntIxAk')
BEGIN
    DROP INDEX [nacoesContinentes].[nacCntIxAk]
    PRINT '<<< DROPPED INDEX [nacoesContinentes].[nacCntIxAk] >>>'
END
go

/* 
 * INDEX: [nacCntIxFkNac] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesContinentes') AND name='nacCntIxFkNac')
BEGIN
    DROP INDEX [nacoesContinentes].[nacCntIxFkNac]
    PRINT '<<< DROPPED INDEX [nacoesContinentes].[nacCntIxFkNac] >>>'
END
go

/* 
 * INDEX: [nacFkNacCtn] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesContinentes') AND name='nacFkNacCtn')
BEGIN
    DROP INDEX [nacoesContinentes].[nacFkNacCtn]
    PRINT '<<< DROPPED INDEX [nacoesContinentes].[nacFkNacCtn] >>>'
END
go

/* 
 * INDEX: [ctnFkNacCtn] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesContinentes') AND name='ctnFkNacCtn')
BEGIN
    DROP INDEX [nacoesContinentes].[ctnFkNacCtn]
    PRINT '<<< DROPPED INDEX [nacoesContinentes].[ctnFkNacCtn] >>>'
END
go

/* 
 * INDEX: [nacCntIxAk] 
 */

CREATE UNIQUE INDEX [nacCntIxAk] ON [nacoesContinentes]([ctnID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesContinentes') AND name='nacCntIxAk')
    PRINT '<<< CREATED INDEX nacoesContinentes.nacCntIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX nacoesContinentes.nacCntIxAk >>>'
go

/* 
 * INDEX: [nacCntIxFkNac] 
 */

CREATE INDEX [nacCntIxFkNac] ON [nacoesContinentes]([nacID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesContinentes') AND name='nacCntIxFkNac')
    PRINT '<<< CREATED INDEX nacoesContinentes.nacCntIxFkNac >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX nacoesContinentes.nacCntIxFkNac >>>'
go

/* 
 * INDEX: [nacFkNacCtn] 
 */

CREATE INDEX [nacFkNacCtn] ON [nacoesContinentes]([nacID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesContinentes') AND name='nacFkNacCtn')
    PRINT '<<< CREATED INDEX nacoesContinentes.nacFkNacCtn >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX nacoesContinentes.nacFkNacCtn >>>'
go

/* 
 * INDEX: [ctnFkNacCtn] 
 */

CREATE INDEX [ctnFkNacCtn] ON [nacoesContinentes]([ctnID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesContinentes') AND name='ctnFkNacCtn')
    PRINT '<<< CREATED INDEX nacoesContinentes.ctnFkNacCtn >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX nacoesContinentes.ctnFkNacCtn >>>'
go

