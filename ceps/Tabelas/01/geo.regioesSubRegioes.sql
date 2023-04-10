IF OBJECT_ID('[geo].[regioesSubRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[regioesSubRegioes]
    PRINT '<<< DROPPED TABLE [geo].[regioesSubRegioes] >>>'
END
go
/* 
 * TABLE: [geo].[regioesSubRegioes] 
 */

CREATE TABLE [geo].[regioesSubRegioes](
    [regSubRegID]  int    IDENTITY(1,1),
    [regID]        int    NOT NULL,
    [subRegID]     int    NOT NULL
)
go



IF OBJECT_ID('geo.regioesSubRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE geo.regioesSubRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE geo.regioesSubRegioes >>>'
go

/* 
 * TABLE: [geo].[regioesSubRegioes] 
 */

ALTER TABLE [geo].[regioesSubRegioes] ADD 
    CONSTRAINT [regSubRegIxPk] PRIMARY KEY CLUSTERED ([regSubRegID])
go

IF OBJECT_ID('geo.regioesSubRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE geo.regioesSubRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE geo.regioesSubRegioes >>>'
go

/* 
 * INDEX: [regSubRegIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.regioesSubRegioes') AND name='regSubRegIxAk')
BEGIN
    DROP INDEX [geo].[regioesSubRegioes].[regSubRegIxAk]
    PRINT '<<< DROPPED INDEX [geo].[regioesSubRegioes].[regSubRegIxAk] >>>'
END
go

/* 
 * INDEX: [regSubRegIxFkReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.regioesSubRegioes') AND name='regSubRegIxFkReg')
BEGIN
    DROP INDEX [geo].[regioesSubRegioes].[regSubRegIxFkReg]
    PRINT '<<< DROPPED INDEX [geo].[regioesSubRegioes].[regSubRegIxFkReg] >>>'
END
go

/* 
 * INDEX: [regFkSubRegReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.regioesSubRegioes') AND name='regFkSubRegReg')
BEGIN
    DROP INDEX [geo].[regioesSubRegioes].[regFkSubRegReg]
    PRINT '<<< DROPPED INDEX [geo].[regioesSubRegioes].[regFkSubRegReg] >>>'
END
go

/* 
 * INDEX: [subRegFkSubRegReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.regioesSubRegioes') AND name='subRegFkSubRegReg')
BEGIN
    DROP INDEX [geo].[regioesSubRegioes].[subRegFkSubRegReg]
    PRINT '<<< DROPPED INDEX [geo].[regioesSubRegioes].[subRegFkSubRegReg] >>>'
END
go

/* 
 * INDEX: [regSubRegIxAk] 
 */

CREATE UNIQUE INDEX [regSubRegIxAk] ON [geo].[regioesSubRegioes]([subRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.regioesSubRegioes') AND name='regSubRegIxAk')
    PRINT '<<< CREATED INDEX geo.regioesSubRegioes.regSubRegIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.regioesSubRegioes.regSubRegIxAk >>>'
go

/* 
 * INDEX: [regSubRegIxFkReg] 
 */

CREATE INDEX [regSubRegIxFkReg] ON [geo].[regioesSubRegioes]([regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.regioesSubRegioes') AND name='regSubRegIxFkReg')
    PRINT '<<< CREATED INDEX geo.regioesSubRegioes.regSubRegIxFkReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.regioesSubRegioes.regSubRegIxFkReg >>>'
go

/* 
 * INDEX: [regFkSubRegReg] 
 */

CREATE INDEX [regFkSubRegReg] ON [geo].[regioesSubRegioes]([regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.regioesSubRegioes') AND name='regFkSubRegReg')
    PRINT '<<< CREATED INDEX geo.regioesSubRegioes.regFkSubRegReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.regioesSubRegioes.regFkSubRegReg >>>'
go

/* 
 * INDEX: [subRegFkSubRegReg] 
 */

CREATE INDEX [subRegFkSubRegReg] ON [geo].[regioesSubRegioes]([subRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.regioesSubRegioes') AND name='subRegFkSubRegReg')
    PRINT '<<< CREATED INDEX geo.regioesSubRegioes.subRegFkSubRegReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.regioesSubRegioes.subRegFkSubRegReg >>>'
go

