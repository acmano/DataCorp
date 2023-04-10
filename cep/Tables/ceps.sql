IF OBJECT_ID('[ceps]') IS NOT NULL
BEGIN
    DROP TABLE [ceps]
    PRINT '<<< DROPPED TABLE [ceps] >>>'
END
go
/* 
 * TABLE: [ceps] 
 */

CREATE TABLE [ceps](
    [cepID]        int    IDENTITY(1,1),
    [subSetDivID]  int    NOT NULL,
    [sufID]        int    NOT NULL
)
go



IF OBJECT_ID('ceps') IS NOT NULL
    PRINT '<<< CREATED TABLE ceps >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ceps >>>'
go

/* 
 * TABLE: [ceps] 
 */

ALTER TABLE [ceps] ADD 
    CONSTRAINT [cepIxPk] PRIMARY KEY CLUSTERED ([cepID])
go

IF OBJECT_ID('ceps') IS NOT NULL
    PRINT '<<< CREATED TABLE ceps >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ceps >>>'
go

/* 
 * INDEX: [cepIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ceps') AND name='cepIxAk')
BEGIN
    DROP INDEX [ceps].[cepIxAk]
    PRINT '<<< DROPPED INDEX [ceps].[cepIxAk] >>>'
END
go

/* 
 * INDEX: [logTipLogIxFkSuf] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ceps') AND name='logTipLogIxFkSuf')
BEGIN
    DROP INDEX [ceps].[logTipLogIxFkSuf]
    PRINT '<<< DROPPED INDEX [ceps].[logTipLogIxFkSuf] >>>'
END
go

/* 
 * INDEX: [logTipLogIxFkSubSetDiv] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ceps') AND name='logTipLogIxFkSubSetDiv')
BEGIN
    DROP INDEX [ceps].[logTipLogIxFkSubSetDiv]
    PRINT '<<< DROPPED INDEX [ceps].[logTipLogIxFkSubSetDiv] >>>'
END
go

/* 
 * INDEX: [cepFkSubSetDiv] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ceps') AND name='cepFkSubSetDiv')
BEGIN
    DROP INDEX [ceps].[cepFkSubSetDiv]
    PRINT '<<< DROPPED INDEX [ceps].[cepFkSubSetDiv] >>>'
END
go

/* 
 * INDEX: [cepFkSuf] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ceps') AND name='cepFkSuf')
BEGIN
    DROP INDEX [ceps].[cepFkSuf]
    PRINT '<<< DROPPED INDEX [ceps].[cepFkSuf] >>>'
END
go

/* 
 * INDEX: [cepIxAk] 
 */

CREATE UNIQUE INDEX [cepIxAk] ON [ceps]([sufID], [subSetDivID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ceps') AND name='cepIxAk')
    PRINT '<<< CREATED INDEX ceps.cepIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ceps.cepIxAk >>>'
go

/* 
 * INDEX: [logTipLogIxFkSuf] 
 */

CREATE INDEX [logTipLogIxFkSuf] ON [ceps]([sufID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ceps') AND name='logTipLogIxFkSuf')
    PRINT '<<< CREATED INDEX ceps.logTipLogIxFkSuf >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ceps.logTipLogIxFkSuf >>>'
go

/* 
 * INDEX: [logTipLogIxFkSubSetDiv] 
 */

CREATE INDEX [logTipLogIxFkSubSetDiv] ON [ceps]([subSetDivID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ceps') AND name='logTipLogIxFkSubSetDiv')
    PRINT '<<< CREATED INDEX ceps.logTipLogIxFkSubSetDiv >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ceps.logTipLogIxFkSubSetDiv >>>'
go

/* 
 * INDEX: [cepFkSubSetDiv] 
 */

CREATE INDEX [cepFkSubSetDiv] ON [ceps]([subSetDivID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ceps') AND name='cepFkSubSetDiv')
    PRINT '<<< CREATED INDEX ceps.cepFkSubSetDiv >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ceps.cepFkSubSetDiv >>>'
go

/* 
 * INDEX: [cepFkSuf] 
 */

CREATE INDEX [cepFkSuf] ON [ceps]([sufID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ceps') AND name='cepFkSuf')
    PRINT '<<< CREATED INDEX ceps.cepFkSuf >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ceps.cepFkSuf >>>'
go

