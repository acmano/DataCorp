IF OBJECT_ID('[cep].[logradouroTipoLogradouro]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[logradouroTipoLogradouro]
    PRINT '<<< DROPPED TABLE [cep].[logradouroTipoLogradouro] >>>'
END
go
/* 
 * TABLE: [cep].[logradouroTipoLogradouro] 
 */

CREATE TABLE [cep].[logradouroTipoLogradouro](
    [logTipLogID]  int    IDENTITY(1,1),
    [logTipID]     int    NOT NULL,
    [logID]        int    NOT NULL
)
go



IF OBJECT_ID('cep.logradouroTipoLogradouro') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.logradouroTipoLogradouro >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.logradouroTipoLogradouro >>>'
go

/* 
 * TABLE: [cep].[logradouroTipoLogradouro] 
 */

ALTER TABLE [cep].[logradouroTipoLogradouro] ADD 
    CONSTRAINT [logTipLogIxPk] PRIMARY KEY CLUSTERED ([logTipLogID])
go

IF OBJECT_ID('cep.logradouroTipoLogradouro') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.logradouroTipoLogradouro >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.logradouroTipoLogradouro >>>'
go

/* 
 * INDEX: [logTipLogIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.logradouroTipoLogradouro') AND name='logTipLogIxAk')
BEGIN
    DROP INDEX [cep].[logradouroTipoLogradouro].[logTipLogIxAk]
    PRINT '<<< DROPPED INDEX [cep].[logradouroTipoLogradouro].[logTipLogIxAk] >>>'
END
go

/* 
 * INDEX: [logTipLogIxFkLog] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.logradouroTipoLogradouro') AND name='logTipLogIxFkLog')
BEGIN
    DROP INDEX [cep].[logradouroTipoLogradouro].[logTipLogIxFkLog]
    PRINT '<<< DROPPED INDEX [cep].[logradouroTipoLogradouro].[logTipLogIxFkLog] >>>'
END
go

/* 
 * INDEX: [logTipLogIxFkLogTip] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.logradouroTipoLogradouro') AND name='logTipLogIxFkLogTip')
BEGIN
    DROP INDEX [cep].[logradouroTipoLogradouro].[logTipLogIxFkLogTip]
    PRINT '<<< DROPPED INDEX [cep].[logradouroTipoLogradouro].[logTipLogIxFkLogTip] >>>'
END
go

/* 
 * INDEX: [logTipLogFkLogTip] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.logradouroTipoLogradouro') AND name='logTipLogFkLogTip')
BEGIN
    DROP INDEX [cep].[logradouroTipoLogradouro].[logTipLogFkLogTip]
    PRINT '<<< DROPPED INDEX [cep].[logradouroTipoLogradouro].[logTipLogFkLogTip] >>>'
END
go

/* 
 * INDEX: [logTipLogFkLog] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.logradouroTipoLogradouro') AND name='logTipLogFkLog')
BEGIN
    DROP INDEX [cep].[logradouroTipoLogradouro].[logTipLogFkLog]
    PRINT '<<< DROPPED INDEX [cep].[logradouroTipoLogradouro].[logTipLogFkLog] >>>'
END
go

/* 
 * INDEX: [logTipLogIxAk] 
 */

CREATE UNIQUE INDEX [logTipLogIxAk] ON [cep].[logradouroTipoLogradouro]([logTipID], [logID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.logradouroTipoLogradouro') AND name='logTipLogIxAk')
    PRINT '<<< CREATED INDEX cep.logradouroTipoLogradouro.logTipLogIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.logradouroTipoLogradouro.logTipLogIxAk >>>'
go

/* 
 * INDEX: [logTipLogIxFkLog] 
 */

CREATE INDEX [logTipLogIxFkLog] ON [cep].[logradouroTipoLogradouro]([logID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.logradouroTipoLogradouro') AND name='logTipLogIxFkLog')
    PRINT '<<< CREATED INDEX cep.logradouroTipoLogradouro.logTipLogIxFkLog >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.logradouroTipoLogradouro.logTipLogIxFkLog >>>'
go

/* 
 * INDEX: [logTipLogIxFkLogTip] 
 */

CREATE INDEX [logTipLogIxFkLogTip] ON [cep].[logradouroTipoLogradouro]([logTipID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.logradouroTipoLogradouro') AND name='logTipLogIxFkLogTip')
    PRINT '<<< CREATED INDEX cep.logradouroTipoLogradouro.logTipLogIxFkLogTip >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.logradouroTipoLogradouro.logTipLogIxFkLogTip >>>'
go

/* 
 * INDEX: [logTipLogFkLogTip] 
 */

CREATE INDEX [logTipLogFkLogTip] ON [cep].[logradouroTipoLogradouro]([logTipID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.logradouroTipoLogradouro') AND name='logTipLogFkLogTip')
    PRINT '<<< CREATED INDEX cep.logradouroTipoLogradouro.logTipLogFkLogTip >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.logradouroTipoLogradouro.logTipLogFkLogTip >>>'
go

/* 
 * INDEX: [logTipLogFkLog] 
 */

CREATE INDEX [logTipLogFkLog] ON [cep].[logradouroTipoLogradouro]([logID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.logradouroTipoLogradouro') AND name='logTipLogFkLog')
    PRINT '<<< CREATED INDEX cep.logradouroTipoLogradouro.logTipLogFkLog >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.logradouroTipoLogradouro.logTipLogFkLog >>>'
go

