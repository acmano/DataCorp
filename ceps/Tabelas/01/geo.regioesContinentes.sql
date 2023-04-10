IF OBJECT_ID('[geo].[regioesContinentes]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[regioesContinentes]
    PRINT '<<< DROPPED TABLE [geo].[regioesContinentes] >>>'
END
go
/* 
 * TABLE: [geo].[regioesContinentes] 
 */

CREATE TABLE [geo].[regioesContinentes](
    [regCtnID]  int    IDENTITY(1,1),
    [ctnID]     int    NOT NULL,
    [regID]     int    NOT NULL
)
go



IF OBJECT_ID('geo.regioesContinentes') IS NOT NULL
    PRINT '<<< CREATED TABLE geo.regioesContinentes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE geo.regioesContinentes >>>'
go

/* 
 * TABLE: [geo].[regioesContinentes] 
 */

ALTER TABLE [geo].[regioesContinentes] ADD 
    CONSTRAINT [regCtnIxPk] PRIMARY KEY CLUSTERED ([regCtnID])
go

IF OBJECT_ID('geo.regioesContinentes') IS NOT NULL
    PRINT '<<< CREATED TABLE geo.regioesContinentes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE geo.regioesContinentes >>>'
go

/* 
 * INDEX: [regCtnIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.regioesContinentes') AND name='regCtnIxAk')
BEGIN
    DROP INDEX [geo].[regioesContinentes].[regCtnIxAk]
    PRINT '<<< DROPPED INDEX [geo].[regioesContinentes].[regCtnIxAk] >>>'
END
go

/* 
 * INDEX: [regCtnIxFkReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.regioesContinentes') AND name='regCtnIxFkReg')
BEGIN
    DROP INDEX [geo].[regioesContinentes].[regCtnIxFkReg]
    PRINT '<<< DROPPED INDEX [geo].[regioesContinentes].[regCtnIxFkReg] >>>'
END
go

/* 
 * INDEX: [ctnFkRegCtn] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.regioesContinentes') AND name='ctnFkRegCtn')
BEGIN
    DROP INDEX [geo].[regioesContinentes].[ctnFkRegCtn]
    PRINT '<<< DROPPED INDEX [geo].[regioesContinentes].[ctnFkRegCtn] >>>'
END
go

/* 
 * INDEX: [regFkRegCtn] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.regioesContinentes') AND name='regFkRegCtn')
BEGIN
    DROP INDEX [geo].[regioesContinentes].[regFkRegCtn]
    PRINT '<<< DROPPED INDEX [geo].[regioesContinentes].[regFkRegCtn] >>>'
END
go

/* 
 * INDEX: [regCtnIxAk] 
 */

CREATE UNIQUE INDEX [regCtnIxAk] ON [geo].[regioesContinentes]([ctnID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.regioesContinentes') AND name='regCtnIxAk')
    PRINT '<<< CREATED INDEX geo.regioesContinentes.regCtnIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.regioesContinentes.regCtnIxAk >>>'
go

/* 
 * INDEX: [regCtnIxFkReg] 
 */

CREATE INDEX [regCtnIxFkReg] ON [geo].[regioesContinentes]([regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.regioesContinentes') AND name='regCtnIxFkReg')
    PRINT '<<< CREATED INDEX geo.regioesContinentes.regCtnIxFkReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.regioesContinentes.regCtnIxFkReg >>>'
go

/* 
 * INDEX: [ctnFkRegCtn] 
 */

CREATE INDEX [ctnFkRegCtn] ON [geo].[regioesContinentes]([ctnID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.regioesContinentes') AND name='ctnFkRegCtn')
    PRINT '<<< CREATED INDEX geo.regioesContinentes.ctnFkRegCtn >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.regioesContinentes.ctnFkRegCtn >>>'
go

/* 
 * INDEX: [regFkRegCtn] 
 */

CREATE INDEX [regFkRegCtn] ON [geo].[regioesContinentes]([regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.regioesContinentes') AND name='regFkRegCtn')
    PRINT '<<< CREATED INDEX geo.regioesContinentes.regFkRegCtn >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.regioesContinentes.regFkRegCtn >>>'
go

