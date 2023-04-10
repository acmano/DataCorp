IF OBJECT_ID('[logradouroTipoLogradouro]') IS NOT NULL
BEGIN
    DROP TABLE [logradouroTipoLogradouro]
    PRINT '<<< DROPPED TABLE [logradouroTipoLogradouro] >>>'
END
go
/* 
 * TABLE: [logradouroTipoLogradouro] 
 */

CREATE TABLE [logradouroTipoLogradouro](
    [logTipLogID]  int    IDENTITY(1,1),
    [logTipID]     int    NOT NULL,
    [logID]        int    NOT NULL
)
go



IF OBJECT_ID('logradouroTipoLogradouro') IS NOT NULL
    PRINT '<<< CREATED TABLE logradouroTipoLogradouro >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE logradouroTipoLogradouro >>>'
go

/* 
 * TABLE: [logradouroTipoLogradouro] 
 */

ALTER TABLE [logradouroTipoLogradouro] ADD 
    CONSTRAINT [logTipLogIxPk] PRIMARY KEY CLUSTERED ([logTipLogID])
go

IF OBJECT_ID('logradouroTipoLogradouro') IS NOT NULL
    PRINT '<<< CREATED TABLE logradouroTipoLogradouro >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE logradouroTipoLogradouro >>>'
go

/* 
 * INDEX: [logTipLogIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('logradouroTipoLogradouro') AND name='logTipLogIxAk')
BEGIN
    DROP INDEX [logradouroTipoLogradouro].[logTipLogIxAk]
    PRINT '<<< DROPPED INDEX [logradouroTipoLogradouro].[logTipLogIxAk] >>>'
END
go

/* 
 * INDEX: [logTipLogIxFkLog] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('logradouroTipoLogradouro') AND name='logTipLogIxFkLog')
BEGIN
    DROP INDEX [logradouroTipoLogradouro].[logTipLogIxFkLog]
    PRINT '<<< DROPPED INDEX [logradouroTipoLogradouro].[logTipLogIxFkLog] >>>'
END
go

/* 
 * INDEX: [logTipLogIxFkLogTip] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('logradouroTipoLogradouro') AND name='logTipLogIxFkLogTip')
BEGIN
    DROP INDEX [logradouroTipoLogradouro].[logTipLogIxFkLogTip]
    PRINT '<<< DROPPED INDEX [logradouroTipoLogradouro].[logTipLogIxFkLogTip] >>>'
END
go

/* 
 * INDEX: [logTipLogFkLogTip] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('logradouroTipoLogradouro') AND name='logTipLogFkLogTip')
BEGIN
    DROP INDEX [logradouroTipoLogradouro].[logTipLogFkLogTip]
    PRINT '<<< DROPPED INDEX [logradouroTipoLogradouro].[logTipLogFkLogTip] >>>'
END
go

/* 
 * INDEX: [logTipLogFkLog] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('logradouroTipoLogradouro') AND name='logTipLogFkLog')
BEGIN
    DROP INDEX [logradouroTipoLogradouro].[logTipLogFkLog]
    PRINT '<<< DROPPED INDEX [logradouroTipoLogradouro].[logTipLogFkLog] >>>'
END
go

/* 
 * INDEX: [logTipLogIxAk] 
 */

CREATE UNIQUE INDEX [logTipLogIxAk] ON [logradouroTipoLogradouro]([logTipID], [logID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('logradouroTipoLogradouro') AND name='logTipLogIxAk')
    PRINT '<<< CREATED INDEX logradouroTipoLogradouro.logTipLogIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX logradouroTipoLogradouro.logTipLogIxAk >>>'
go

/* 
 * INDEX: [logTipLogIxFkLog] 
 */

CREATE INDEX [logTipLogIxFkLog] ON [logradouroTipoLogradouro]([logID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('logradouroTipoLogradouro') AND name='logTipLogIxFkLog')
    PRINT '<<< CREATED INDEX logradouroTipoLogradouro.logTipLogIxFkLog >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX logradouroTipoLogradouro.logTipLogIxFkLog >>>'
go

/* 
 * INDEX: [logTipLogIxFkLogTip] 
 */

CREATE INDEX [logTipLogIxFkLogTip] ON [logradouroTipoLogradouro]([logTipID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('logradouroTipoLogradouro') AND name='logTipLogIxFkLogTip')
    PRINT '<<< CREATED INDEX logradouroTipoLogradouro.logTipLogIxFkLogTip >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX logradouroTipoLogradouro.logTipLogIxFkLogTip >>>'
go

/* 
 * INDEX: [logTipLogFkLogTip] 
 */

CREATE INDEX [logTipLogFkLogTip] ON [logradouroTipoLogradouro]([logTipID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('logradouroTipoLogradouro') AND name='logTipLogFkLogTip')
    PRINT '<<< CREATED INDEX logradouroTipoLogradouro.logTipLogFkLogTip >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX logradouroTipoLogradouro.logTipLogFkLogTip >>>'
go

/* 
 * INDEX: [logTipLogFkLog] 
 */

CREATE INDEX [logTipLogFkLog] ON [logradouroTipoLogradouro]([logID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('logradouroTipoLogradouro') AND name='logTipLogFkLog')
    PRINT '<<< CREATED INDEX logradouroTipoLogradouro.logTipLogFkLog >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX logradouroTipoLogradouro.logTipLogFkLog >>>'
go

