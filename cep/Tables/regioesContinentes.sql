IF OBJECT_ID('[regioesContinentes]') IS NOT NULL
BEGIN
    DROP TABLE [regioesContinentes]
    PRINT '<<< DROPPED TABLE [regioesContinentes] >>>'
END
go
/* 
 * TABLE: [regioesContinentes] 
 */

CREATE TABLE [regioesContinentes](
    [regCtnID]  int    IDENTITY(1,1),
    [ctnID]     int    NOT NULL,
    [regID]     int    NOT NULL
)
go



IF OBJECT_ID('regioesContinentes') IS NOT NULL
    PRINT '<<< CREATED TABLE regioesContinentes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE regioesContinentes >>>'
go

/* 
 * TABLE: [regioesContinentes] 
 */

ALTER TABLE [regioesContinentes] ADD 
    CONSTRAINT [regCtnIxPk] PRIMARY KEY CLUSTERED ([regCtnID])
go

IF OBJECT_ID('regioesContinentes') IS NOT NULL
    PRINT '<<< CREATED TABLE regioesContinentes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE regioesContinentes >>>'
go

/* 
 * INDEX: [regCtnIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesContinentes') AND name='regCtnIxAk')
BEGIN
    DROP INDEX [regioesContinentes].[regCtnIxAk]
    PRINT '<<< DROPPED INDEX [regioesContinentes].[regCtnIxAk] >>>'
END
go

/* 
 * INDEX: [regCtnIxFkReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesContinentes') AND name='regCtnIxFkReg')
BEGIN
    DROP INDEX [regioesContinentes].[regCtnIxFkReg]
    PRINT '<<< DROPPED INDEX [regioesContinentes].[regCtnIxFkReg] >>>'
END
go

/* 
 * INDEX: [ctnFkRegCtn] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesContinentes') AND name='ctnFkRegCtn')
BEGIN
    DROP INDEX [regioesContinentes].[ctnFkRegCtn]
    PRINT '<<< DROPPED INDEX [regioesContinentes].[ctnFkRegCtn] >>>'
END
go

/* 
 * INDEX: [regFkRegCtn] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesContinentes') AND name='regFkRegCtn')
BEGIN
    DROP INDEX [regioesContinentes].[regFkRegCtn]
    PRINT '<<< DROPPED INDEX [regioesContinentes].[regFkRegCtn] >>>'
END
go

/* 
 * INDEX: [regCtnIxAk] 
 */

CREATE UNIQUE INDEX [regCtnIxAk] ON [regioesContinentes]([ctnID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesContinentes') AND name='regCtnIxAk')
    PRINT '<<< CREATED INDEX regioesContinentes.regCtnIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX regioesContinentes.regCtnIxAk >>>'
go

/* 
 * INDEX: [regCtnIxFkReg] 
 */

CREATE INDEX [regCtnIxFkReg] ON [regioesContinentes]([regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesContinentes') AND name='regCtnIxFkReg')
    PRINT '<<< CREATED INDEX regioesContinentes.regCtnIxFkReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX regioesContinentes.regCtnIxFkReg >>>'
go

/* 
 * INDEX: [ctnFkRegCtn] 
 */

CREATE INDEX [ctnFkRegCtn] ON [regioesContinentes]([ctnID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesContinentes') AND name='ctnFkRegCtn')
    PRINT '<<< CREATED INDEX regioesContinentes.ctnFkRegCtn >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX regioesContinentes.ctnFkRegCtn >>>'
go

/* 
 * INDEX: [regFkRegCtn] 
 */

CREATE INDEX [regFkRegCtn] ON [regioesContinentes]([regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesContinentes') AND name='regFkRegCtn')
    PRINT '<<< CREATED INDEX regioesContinentes.regFkRegCtn >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX regioesContinentes.regFkRegCtn >>>'
go

