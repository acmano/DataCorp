IF OBJECT_ID('[regioesSubRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [regioesSubRegioes]
    PRINT '<<< DROPPED TABLE [regioesSubRegioes] >>>'
END
go
/* 
 * TABLE: [regioesSubRegioes] 
 */

CREATE TABLE [regioesSubRegioes](
    [regSubRegID]  int    IDENTITY(1,1),
    [regID]        int    NOT NULL,
    [subRegID]     int    NOT NULL
)
go



IF OBJECT_ID('regioesSubRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE regioesSubRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE regioesSubRegioes >>>'
go

/* 
 * TABLE: [regioesSubRegioes] 
 */

ALTER TABLE [regioesSubRegioes] ADD 
    CONSTRAINT [regSubRegIxPk] PRIMARY KEY CLUSTERED ([regSubRegID])
go

IF OBJECT_ID('regioesSubRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE regioesSubRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE regioesSubRegioes >>>'
go

/* 
 * INDEX: [regSubRegIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesSubRegioes') AND name='regSubRegIxAk')
BEGIN
    DROP INDEX [regioesSubRegioes].[regSubRegIxAk]
    PRINT '<<< DROPPED INDEX [regioesSubRegioes].[regSubRegIxAk] >>>'
END
go

/* 
 * INDEX: [regSubRegIxFkSubReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesSubRegioes') AND name='regSubRegIxFkSubReg')
BEGIN
    DROP INDEX [regioesSubRegioes].[regSubRegIxFkSubReg]
    PRINT '<<< DROPPED INDEX [regioesSubRegioes].[regSubRegIxFkSubReg] >>>'
END
go

/* 
 * INDEX: [regSubRegIxFkReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesSubRegioes') AND name='regSubRegIxFkReg')
BEGIN
    DROP INDEX [regioesSubRegioes].[regSubRegIxFkReg]
    PRINT '<<< DROPPED INDEX [regioesSubRegioes].[regSubRegIxFkReg] >>>'
END
go

/* 
 * INDEX: [sugRegRegFkReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesSubRegioes') AND name='sugRegRegFkReg')
BEGIN
    DROP INDEX [regioesSubRegioes].[sugRegRegFkReg]
    PRINT '<<< DROPPED INDEX [regioesSubRegioes].[sugRegRegFkReg] >>>'
END
go

/* 
 * INDEX: [subRegRegFkSubReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesSubRegioes') AND name='subRegRegFkSubReg')
BEGIN
    DROP INDEX [regioesSubRegioes].[subRegRegFkSubReg]
    PRINT '<<< DROPPED INDEX [regioesSubRegioes].[subRegRegFkSubReg] >>>'
END
go

/* 
 * INDEX: [regSubRegIxAk] 
 */

CREATE UNIQUE INDEX [regSubRegIxAk] ON [regioesSubRegioes]([subRegID], [regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesSubRegioes') AND name='regSubRegIxAk')
    PRINT '<<< CREATED INDEX regioesSubRegioes.regSubRegIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX regioesSubRegioes.regSubRegIxAk >>>'
go

/* 
 * INDEX: [regSubRegIxFkSubReg] 
 */

CREATE INDEX [regSubRegIxFkSubReg] ON [regioesSubRegioes]([subRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesSubRegioes') AND name='regSubRegIxFkSubReg')
    PRINT '<<< CREATED INDEX regioesSubRegioes.regSubRegIxFkSubReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX regioesSubRegioes.regSubRegIxFkSubReg >>>'
go

/* 
 * INDEX: [regSubRegIxFkReg] 
 */

CREATE INDEX [regSubRegIxFkReg] ON [regioesSubRegioes]([regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesSubRegioes') AND name='regSubRegIxFkReg')
    PRINT '<<< CREATED INDEX regioesSubRegioes.regSubRegIxFkReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX regioesSubRegioes.regSubRegIxFkReg >>>'
go

/* 
 * INDEX: [sugRegRegFkReg] 
 */

CREATE INDEX [sugRegRegFkReg] ON [regioesSubRegioes]([regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesSubRegioes') AND name='sugRegRegFkReg')
    PRINT '<<< CREATED INDEX regioesSubRegioes.sugRegRegFkReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX regioesSubRegioes.sugRegRegFkReg >>>'
go

/* 
 * INDEX: [subRegRegFkSubReg] 
 */

CREATE INDEX [subRegRegFkSubReg] ON [regioesSubRegioes]([subRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesSubRegioes') AND name='subRegRegFkSubReg')
    PRINT '<<< CREATED INDEX regioesSubRegioes.subRegRegFkSubReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX regioesSubRegioes.subRegRegFkSubReg >>>'
go

