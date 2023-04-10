IF OBJECT_ID('[cep].[regioesSubRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[regioesSubRegioes]
    PRINT '<<< DROPPED TABLE [cep].[regioesSubRegioes] >>>'
END
go
/* 
 * TABLE: [cep].[regioesSubRegioes] 
 */

CREATE TABLE [cep].[regioesSubRegioes](
    [regSubRegID]  int    IDENTITY(1,1),
    [regID]        int    NOT NULL,
    [subRegID]     int    NOT NULL
)
go



IF OBJECT_ID('cep.regioesSubRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.regioesSubRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.regioesSubRegioes >>>'
go

/* 
 * TABLE: [cep].[regioesSubRegioes] 
 */

ALTER TABLE [cep].[regioesSubRegioes] ADD 
    CONSTRAINT [regSubRegIxPk] PRIMARY KEY CLUSTERED ([regSubRegID])
go

IF OBJECT_ID('cep.regioesSubRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.regioesSubRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.regioesSubRegioes >>>'
go

/* 
 * INDEX: [regSubRegIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.regioesSubRegioes') AND name='regSubRegIxAk')
BEGIN
    DROP INDEX [cep].[regioesSubRegioes].[regSubRegIxAk]
    PRINT '<<< DROPPED INDEX [cep].[regioesSubRegioes].[regSubRegIxAk] >>>'
END
go

/* 
 * INDEX: [regSubRegIxFkSubReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.regioesSubRegioes') AND name='regSubRegIxFkSubReg')
BEGIN
    DROP INDEX [cep].[regioesSubRegioes].[regSubRegIxFkSubReg]
    PRINT '<<< DROPPED INDEX [cep].[regioesSubRegioes].[regSubRegIxFkSubReg] >>>'
END
go

/* 
 * INDEX: [regSubRegIxFkReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.regioesSubRegioes') AND name='regSubRegIxFkReg')
BEGIN
    DROP INDEX [cep].[regioesSubRegioes].[regSubRegIxFkReg]
    PRINT '<<< DROPPED INDEX [cep].[regioesSubRegioes].[regSubRegIxFkReg] >>>'
END
go

/* 
 * INDEX: [sugRegRegFkReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.regioesSubRegioes') AND name='sugRegRegFkReg')
BEGIN
    DROP INDEX [cep].[regioesSubRegioes].[sugRegRegFkReg]
    PRINT '<<< DROPPED INDEX [cep].[regioesSubRegioes].[sugRegRegFkReg] >>>'
END
go

/* 
 * INDEX: [subRegRegFkSubReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.regioesSubRegioes') AND name='subRegRegFkSubReg')
BEGIN
    DROP INDEX [cep].[regioesSubRegioes].[subRegRegFkSubReg]
    PRINT '<<< DROPPED INDEX [cep].[regioesSubRegioes].[subRegRegFkSubReg] >>>'
END
go

/* 
 * INDEX: [regSubRegIxAk] 
 */

CREATE UNIQUE INDEX [regSubRegIxAk] ON [cep].[regioesSubRegioes]([subRegID], [regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.regioesSubRegioes') AND name='regSubRegIxAk')
    PRINT '<<< CREATED INDEX cep.regioesSubRegioes.regSubRegIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.regioesSubRegioes.regSubRegIxAk >>>'
go

/* 
 * INDEX: [regSubRegIxFkSubReg] 
 */

CREATE INDEX [regSubRegIxFkSubReg] ON [cep].[regioesSubRegioes]([subRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.regioesSubRegioes') AND name='regSubRegIxFkSubReg')
    PRINT '<<< CREATED INDEX cep.regioesSubRegioes.regSubRegIxFkSubReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.regioesSubRegioes.regSubRegIxFkSubReg >>>'
go

/* 
 * INDEX: [regSubRegIxFkReg] 
 */

CREATE INDEX [regSubRegIxFkReg] ON [cep].[regioesSubRegioes]([regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.regioesSubRegioes') AND name='regSubRegIxFkReg')
    PRINT '<<< CREATED INDEX cep.regioesSubRegioes.regSubRegIxFkReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.regioesSubRegioes.regSubRegIxFkReg >>>'
go

/* 
 * INDEX: [sugRegRegFkReg] 
 */

CREATE INDEX [sugRegRegFkReg] ON [cep].[regioesSubRegioes]([regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.regioesSubRegioes') AND name='sugRegRegFkReg')
    PRINT '<<< CREATED INDEX cep.regioesSubRegioes.sugRegRegFkReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.regioesSubRegioes.sugRegRegFkReg >>>'
go

/* 
 * INDEX: [subRegRegFkSubReg] 
 */

CREATE INDEX [subRegRegFkSubReg] ON [cep].[regioesSubRegioes]([subRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.regioesSubRegioes') AND name='subRegRegFkSubReg')
    PRINT '<<< CREATED INDEX cep.regioesSubRegioes.subRegRegFkSubReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.regioesSubRegioes.subRegRegFkSubReg >>>'
go

