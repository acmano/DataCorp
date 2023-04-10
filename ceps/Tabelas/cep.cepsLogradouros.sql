IF OBJECT_ID('[cep].[cepsLogradouros]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[cepsLogradouros]
    PRINT '<<< DROPPED TABLE [cep].[cepsLogradouros] >>>'
END
go
/* 
 * TABLE: [cep].[cepsLogradouros] 
 */

CREATE TABLE [cep].[cepsLogradouros](
    [cepLogID]     int    IDENTITY(1,1),
    [cepID]        int    NOT NULL,
    [logTipLogID]  int    NOT NULL
)
go



IF OBJECT_ID('cep.cepsLogradouros') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.cepsLogradouros >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.cepsLogradouros >>>'
go

/* 
 * TABLE: [cep].[cepsLogradouros] 
 */

ALTER TABLE [cep].[cepsLogradouros] ADD 
    CONSTRAINT [cepLogIxPk] PRIMARY KEY CLUSTERED ([cepLogID])
go

IF OBJECT_ID('cep.cepsLogradouros') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.cepsLogradouros >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.cepsLogradouros >>>'
go

/* 
 * INDEX: [cepLogIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsLogradouros') AND name='cepLogIxAk')
BEGIN
    DROP INDEX [cep].[cepsLogradouros].[cepLogIxAk]
    PRINT '<<< DROPPED INDEX [cep].[cepsLogradouros].[cepLogIxAk] >>>'
END
go

/* 
 * INDEX: [cepLogIxFkCep] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsLogradouros') AND name='cepLogIxFkCep')
BEGIN
    DROP INDEX [cep].[cepsLogradouros].[cepLogIxFkCep]
    PRINT '<<< DROPPED INDEX [cep].[cepsLogradouros].[cepLogIxFkCep] >>>'
END
go

/* 
 * INDEX: [cepLogIxFkLogTipLog] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsLogradouros') AND name='cepLogIxFkLogTipLog')
BEGIN
    DROP INDEX [cep].[cepsLogradouros].[cepLogIxFkLogTipLog]
    PRINT '<<< DROPPED INDEX [cep].[cepsLogradouros].[cepLogIxFkLogTipLog] >>>'
END
go

/* 
 * INDEX: [cepFkCepLog] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsLogradouros') AND name='cepFkCepLog')
BEGIN
    DROP INDEX [cep].[cepsLogradouros].[cepFkCepLog]
    PRINT '<<< DROPPED INDEX [cep].[cepsLogradouros].[cepFkCepLog] >>>'
END
go

/* 
 * INDEX: [cepLogFkLogTipLog] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsLogradouros') AND name='cepLogFkLogTipLog')
BEGIN
    DROP INDEX [cep].[cepsLogradouros].[cepLogFkLogTipLog]
    PRINT '<<< DROPPED INDEX [cep].[cepsLogradouros].[cepLogFkLogTipLog] >>>'
END
go

/* 
 * INDEX: [cepLogIxAk] 
 */

CREATE UNIQUE INDEX [cepLogIxAk] ON [cep].[cepsLogradouros]([logTipLogID], [cepID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsLogradouros') AND name='cepLogIxAk')
    PRINT '<<< CREATED INDEX cep.cepsLogradouros.cepLogIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.cepsLogradouros.cepLogIxAk >>>'
go

/* 
 * INDEX: [cepLogIxFkCep] 
 */

CREATE INDEX [cepLogIxFkCep] ON [cep].[cepsLogradouros]([cepID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsLogradouros') AND name='cepLogIxFkCep')
    PRINT '<<< CREATED INDEX cep.cepsLogradouros.cepLogIxFkCep >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.cepsLogradouros.cepLogIxFkCep >>>'
go

/* 
 * INDEX: [cepLogIxFkLogTipLog] 
 */

CREATE INDEX [cepLogIxFkLogTipLog] ON [cep].[cepsLogradouros]([logTipLogID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsLogradouros') AND name='cepLogIxFkLogTipLog')
    PRINT '<<< CREATED INDEX cep.cepsLogradouros.cepLogIxFkLogTipLog >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.cepsLogradouros.cepLogIxFkLogTipLog >>>'
go

/* 
 * INDEX: [cepFkCepLog] 
 */

CREATE INDEX [cepFkCepLog] ON [cep].[cepsLogradouros]([cepID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsLogradouros') AND name='cepFkCepLog')
    PRINT '<<< CREATED INDEX cep.cepsLogradouros.cepFkCepLog >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.cepsLogradouros.cepFkCepLog >>>'
go

/* 
 * INDEX: [cepLogFkLogTipLog] 
 */

CREATE INDEX [cepLogFkLogTipLog] ON [cep].[cepsLogradouros]([logTipLogID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsLogradouros') AND name='cepLogFkLogTipLog')
    PRINT '<<< CREATED INDEX cep.cepsLogradouros.cepLogFkLogTipLog >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.cepsLogradouros.cepLogFkLogTipLog >>>'
go

