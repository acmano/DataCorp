IF OBJECT_ID('[cep].[setoresSubRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[setoresSubRegioes]
    PRINT '<<< DROPPED TABLE [cep].[setoresSubRegioes] >>>'
END
go
/* 
 * TABLE: [cep].[setoresSubRegioes] 
 */

CREATE TABLE [cep].[setoresSubRegioes](
    [setSubRegID]  int    IDENTITY(1,1),
    [subRegID]     int    NOT NULL,
    [setID]        int    NOT NULL
)
go



IF OBJECT_ID('cep.setoresSubRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.setoresSubRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.setoresSubRegioes >>>'
go

/* 
 * TABLE: [cep].[setoresSubRegioes] 
 */

ALTER TABLE [cep].[setoresSubRegioes] ADD 
    CONSTRAINT [setSubRegIxPk] PRIMARY KEY CLUSTERED ([setSubRegID])
go

IF OBJECT_ID('cep.setoresSubRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.setoresSubRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.setoresSubRegioes >>>'
go

/* 
 * INDEX: [setSubRegIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.setoresSubRegioes') AND name='setSubRegIxAk')
BEGIN
    DROP INDEX [cep].[setoresSubRegioes].[setSubRegIxAk]
    PRINT '<<< DROPPED INDEX [cep].[setoresSubRegioes].[setSubRegIxAk] >>>'
END
go

/* 
 * INDEX: [setSubRegIxFkSet] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.setoresSubRegioes') AND name='setSubRegIxFkSet')
BEGIN
    DROP INDEX [cep].[setoresSubRegioes].[setSubRegIxFkSet]
    PRINT '<<< DROPPED INDEX [cep].[setoresSubRegioes].[setSubRegIxFkSet] >>>'
END
go

/* 
 * INDEX: [setSubRegIxFkSubSet] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.setoresSubRegioes') AND name='setSubRegIxFkSubSet')
BEGIN
    DROP INDEX [cep].[setoresSubRegioes].[setSubRegIxFkSubSet]
    PRINT '<<< DROPPED INDEX [cep].[setoresSubRegioes].[setSubRegIxFkSubSet] >>>'
END
go

/* 
 * INDEX: [setSubRegFkSubReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.setoresSubRegioes') AND name='setSubRegFkSubReg')
BEGIN
    DROP INDEX [cep].[setoresSubRegioes].[setSubRegFkSubReg]
    PRINT '<<< DROPPED INDEX [cep].[setoresSubRegioes].[setSubRegFkSubReg] >>>'
END
go

/* 
 * INDEX: [setSubRegFkSet] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.setoresSubRegioes') AND name='setSubRegFkSet')
BEGIN
    DROP INDEX [cep].[setoresSubRegioes].[setSubRegFkSet]
    PRINT '<<< DROPPED INDEX [cep].[setoresSubRegioes].[setSubRegFkSet] >>>'
END
go

/* 
 * INDEX: [setSubRegIxAk] 
 */

CREATE UNIQUE INDEX [setSubRegIxAk] ON [cep].[setoresSubRegioes]([setID], [subRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.setoresSubRegioes') AND name='setSubRegIxAk')
    PRINT '<<< CREATED INDEX cep.setoresSubRegioes.setSubRegIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.setoresSubRegioes.setSubRegIxAk >>>'
go

/* 
 * INDEX: [setSubRegIxFkSet] 
 */

CREATE INDEX [setSubRegIxFkSet] ON [cep].[setoresSubRegioes]([setID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.setoresSubRegioes') AND name='setSubRegIxFkSet')
    PRINT '<<< CREATED INDEX cep.setoresSubRegioes.setSubRegIxFkSet >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.setoresSubRegioes.setSubRegIxFkSet >>>'
go

/* 
 * INDEX: [setSubRegIxFkSubSet] 
 */

CREATE INDEX [setSubRegIxFkSubSet] ON [cep].[setoresSubRegioes]([subRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.setoresSubRegioes') AND name='setSubRegIxFkSubSet')
    PRINT '<<< CREATED INDEX cep.setoresSubRegioes.setSubRegIxFkSubSet >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.setoresSubRegioes.setSubRegIxFkSubSet >>>'
go

/* 
 * INDEX: [setSubRegFkSubReg] 
 */

CREATE INDEX [setSubRegFkSubReg] ON [cep].[setoresSubRegioes]([subRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.setoresSubRegioes') AND name='setSubRegFkSubReg')
    PRINT '<<< CREATED INDEX cep.setoresSubRegioes.setSubRegFkSubReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.setoresSubRegioes.setSubRegFkSubReg >>>'
go

/* 
 * INDEX: [setSubRegFkSet] 
 */

CREATE INDEX [setSubRegFkSet] ON [cep].[setoresSubRegioes]([setID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.setoresSubRegioes') AND name='setSubRegFkSet')
    PRINT '<<< CREATED INDEX cep.setoresSubRegioes.setSubRegFkSet >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.setoresSubRegioes.setSubRegFkSet >>>'
go

