IF OBJECT_ID('[cepsLogradouros]') IS NOT NULL
BEGIN
    DROP TABLE [cepsLogradouros]
    PRINT '<<< DROPPED TABLE [cepsLogradouros] >>>'
END
go
/* 
 * TABLE: [cepsLogradouros] 
 */

CREATE TABLE [cepsLogradouros](
    [cepLogID]     int    IDENTITY(1,1),
    [cepID]        int    NOT NULL,
    [logTipLogID]  int    NOT NULL
)
go



IF OBJECT_ID('cepsLogradouros') IS NOT NULL
    PRINT '<<< CREATED TABLE cepsLogradouros >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cepsLogradouros >>>'
go

/* 
 * TABLE: [cepsLogradouros] 
 */

ALTER TABLE [cepsLogradouros] ADD 
    CONSTRAINT [cepLogIxPk] PRIMARY KEY CLUSTERED ([cepLogID])
go

IF OBJECT_ID('cepsLogradouros') IS NOT NULL
    PRINT '<<< CREATED TABLE cepsLogradouros >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cepsLogradouros >>>'
go

/* 
 * INDEX: [cepLogIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsLogradouros') AND name='cepLogIxAk')
BEGIN
    DROP INDEX [cepsLogradouros].[cepLogIxAk]
    PRINT '<<< DROPPED INDEX [cepsLogradouros].[cepLogIxAk] >>>'
END
go

/* 
 * INDEX: [cepLogIxFkCep] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsLogradouros') AND name='cepLogIxFkCep')
BEGIN
    DROP INDEX [cepsLogradouros].[cepLogIxFkCep]
    PRINT '<<< DROPPED INDEX [cepsLogradouros].[cepLogIxFkCep] >>>'
END
go

/* 
 * INDEX: [cepLogIxFkLogTipLog] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsLogradouros') AND name='cepLogIxFkLogTipLog')
BEGIN
    DROP INDEX [cepsLogradouros].[cepLogIxFkLogTipLog]
    PRINT '<<< DROPPED INDEX [cepsLogradouros].[cepLogIxFkLogTipLog] >>>'
END
go

/* 
 * INDEX: [cepFkCepLog] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsLogradouros') AND name='cepFkCepLog')
BEGIN
    DROP INDEX [cepsLogradouros].[cepFkCepLog]
    PRINT '<<< DROPPED INDEX [cepsLogradouros].[cepFkCepLog] >>>'
END
go

/* 
 * INDEX: [cepLogFkLogTipLog] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsLogradouros') AND name='cepLogFkLogTipLog')
BEGIN
    DROP INDEX [cepsLogradouros].[cepLogFkLogTipLog]
    PRINT '<<< DROPPED INDEX [cepsLogradouros].[cepLogFkLogTipLog] >>>'
END
go

/* 
 * INDEX: [cepLogIxAk] 
 */

CREATE UNIQUE INDEX [cepLogIxAk] ON [cepsLogradouros]([logTipLogID], [cepID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsLogradouros') AND name='cepLogIxAk')
    PRINT '<<< CREATED INDEX cepsLogradouros.cepLogIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cepsLogradouros.cepLogIxAk >>>'
go

/* 
 * INDEX: [cepLogIxFkCep] 
 */

CREATE INDEX [cepLogIxFkCep] ON [cepsLogradouros]([cepID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsLogradouros') AND name='cepLogIxFkCep')
    PRINT '<<< CREATED INDEX cepsLogradouros.cepLogIxFkCep >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cepsLogradouros.cepLogIxFkCep >>>'
go

/* 
 * INDEX: [cepLogIxFkLogTipLog] 
 */

CREATE INDEX [cepLogIxFkLogTipLog] ON [cepsLogradouros]([logTipLogID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsLogradouros') AND name='cepLogIxFkLogTipLog')
    PRINT '<<< CREATED INDEX cepsLogradouros.cepLogIxFkLogTipLog >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cepsLogradouros.cepLogIxFkLogTipLog >>>'
go

/* 
 * INDEX: [cepFkCepLog] 
 */

CREATE INDEX [cepFkCepLog] ON [cepsLogradouros]([cepID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsLogradouros') AND name='cepFkCepLog')
    PRINT '<<< CREATED INDEX cepsLogradouros.cepFkCepLog >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cepsLogradouros.cepFkCepLog >>>'
go

/* 
 * INDEX: [cepLogFkLogTipLog] 
 */

CREATE INDEX [cepLogFkLogTipLog] ON [cepsLogradouros]([logTipLogID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsLogradouros') AND name='cepLogFkLogTipLog')
    PRINT '<<< CREATED INDEX cepsLogradouros.cepLogFkLogTipLog >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cepsLogradouros.cepLogFkLogTipLog >>>'
go

