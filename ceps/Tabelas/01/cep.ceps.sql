IF OBJECT_ID('[cep].[ceps]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[ceps]
    PRINT '<<< DROPPED TABLE [cep].[ceps] >>>'
END
go
/* 
 * TABLE: [cep].[ceps] 
 */

CREATE TABLE [cep].[ceps](
    [cepID]        int    IDENTITY(1,1),
    [subSetDivID]  int    NOT NULL,
    [sufID]        int    NOT NULL
)
go



IF OBJECT_ID('cep.ceps') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.ceps >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.ceps >>>'
go

/* 
 * TABLE: [cep].[ceps] 
 */

ALTER TABLE [cep].[ceps] ADD 
    CONSTRAINT [cepIxPk] PRIMARY KEY CLUSTERED ([cepID])
go

IF OBJECT_ID('cep.ceps') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.ceps >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.ceps >>>'
go

/* 
 * INDEX: [cepIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.ceps') AND name='cepIxAk')
BEGIN
    DROP INDEX [cep].[ceps].[cepIxAk]
    PRINT '<<< DROPPED INDEX [cep].[ceps].[cepIxAk] >>>'
END
go

/* 
 * INDEX: [logTipLogIxFkSuf] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.ceps') AND name='logTipLogIxFkSuf')
BEGIN
    DROP INDEX [cep].[ceps].[logTipLogIxFkSuf]
    PRINT '<<< DROPPED INDEX [cep].[ceps].[logTipLogIxFkSuf] >>>'
END
go

/* 
 * INDEX: [logTipLogIxFkSubSetDiv] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.ceps') AND name='logTipLogIxFkSubSetDiv')
BEGIN
    DROP INDEX [cep].[ceps].[logTipLogIxFkSubSetDiv]
    PRINT '<<< DROPPED INDEX [cep].[ceps].[logTipLogIxFkSubSetDiv] >>>'
END
go

/* 
 * INDEX: [cepFkSubSetDiv] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.ceps') AND name='cepFkSubSetDiv')
BEGIN
    DROP INDEX [cep].[ceps].[cepFkSubSetDiv]
    PRINT '<<< DROPPED INDEX [cep].[ceps].[cepFkSubSetDiv] >>>'
END
go

/* 
 * INDEX: [cepFkSuf] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.ceps') AND name='cepFkSuf')
BEGIN
    DROP INDEX [cep].[ceps].[cepFkSuf]
    PRINT '<<< DROPPED INDEX [cep].[ceps].[cepFkSuf] >>>'
END
go

/* 
 * INDEX: [cepIxAk] 
 */

CREATE UNIQUE INDEX [cepIxAk] ON [cep].[ceps]([sufID], [subSetDivID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.ceps') AND name='cepIxAk')
    PRINT '<<< CREATED INDEX cep.ceps.cepIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.ceps.cepIxAk >>>'
go

/* 
 * INDEX: [logTipLogIxFkSuf] 
 */

CREATE INDEX [logTipLogIxFkSuf] ON [cep].[ceps]([sufID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.ceps') AND name='logTipLogIxFkSuf')
    PRINT '<<< CREATED INDEX cep.ceps.logTipLogIxFkSuf >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.ceps.logTipLogIxFkSuf >>>'
go

/* 
 * INDEX: [logTipLogIxFkSubSetDiv] 
 */

CREATE INDEX [logTipLogIxFkSubSetDiv] ON [cep].[ceps]([subSetDivID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.ceps') AND name='logTipLogIxFkSubSetDiv')
    PRINT '<<< CREATED INDEX cep.ceps.logTipLogIxFkSubSetDiv >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.ceps.logTipLogIxFkSubSetDiv >>>'
go

/* 
 * INDEX: [cepFkSubSetDiv] 
 */

CREATE INDEX [cepFkSubSetDiv] ON [cep].[ceps]([subSetDivID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.ceps') AND name='cepFkSubSetDiv')
    PRINT '<<< CREATED INDEX cep.ceps.cepFkSubSetDiv >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.ceps.cepFkSubSetDiv >>>'
go

/* 
 * INDEX: [cepFkSuf] 
 */

CREATE INDEX [cepFkSuf] ON [cep].[ceps]([sufID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.ceps') AND name='cepFkSuf')
    PRINT '<<< CREATED INDEX cep.ceps.cepFkSuf >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.ceps.cepFkSuf >>>'
go

