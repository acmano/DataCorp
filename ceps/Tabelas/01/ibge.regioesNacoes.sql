IF OBJECT_ID('[ibge].[regioesNacoes]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[regioesNacoes]
    PRINT '<<< DROPPED TABLE [ibge].[regioesNacoes] >>>'
END
go
/* 
 * TABLE: [ibge].[regioesNacoes] 
 */

CREATE TABLE [ibge].[regioesNacoes](
    [regNacID]  int    IDENTITY(1,1),
    [nacID]     int    NOT NULL,
    [regID]     int    NOT NULL
)
go



IF OBJECT_ID('ibge.regioesNacoes') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.regioesNacoes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.regioesNacoes >>>'
go

/* 
 * TABLE: [ibge].[regioesNacoes] 
 */

ALTER TABLE [ibge].[regioesNacoes] ADD 
    CONSTRAINT [regNacIxPk] PRIMARY KEY CLUSTERED ([regNacID])
go

IF OBJECT_ID('ibge.regioesNacoes') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.regioesNacoes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.regioesNacoes >>>'
go

/* 
 * INDEX: [regNacIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesNacoes') AND name='regNacIxAk')
BEGIN
    DROP INDEX [ibge].[regioesNacoes].[regNacIxAk]
    PRINT '<<< DROPPED INDEX [ibge].[regioesNacoes].[regNacIxAk] >>>'
END
go

/* 
 * INDEX: [regNacIxFkNac] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesNacoes') AND name='regNacIxFkNac')
BEGIN
    DROP INDEX [ibge].[regioesNacoes].[regNacIxFkNac]
    PRINT '<<< DROPPED INDEX [ibge].[regioesNacoes].[regNacIxFkNac] >>>'
END
go

/* 
 * INDEX: [regNacIxFkReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesNacoes') AND name='regNacIxFkReg')
BEGIN
    DROP INDEX [ibge].[regioesNacoes].[regNacIxFkReg]
    PRINT '<<< DROPPED INDEX [ibge].[regioesNacoes].[regNacIxFkReg] >>>'
END
go

/* 
 * INDEX: [regNacFkNac] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesNacoes') AND name='regNacFkNac')
BEGIN
    DROP INDEX [ibge].[regioesNacoes].[regNacFkNac]
    PRINT '<<< DROPPED INDEX [ibge].[regioesNacoes].[regNacFkNac] >>>'
END
go

/* 
 * INDEX: [regNacFkReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesNacoes') AND name='regNacFkReg')
BEGIN
    DROP INDEX [ibge].[regioesNacoes].[regNacFkReg]
    PRINT '<<< DROPPED INDEX [ibge].[regioesNacoes].[regNacFkReg] >>>'
END
go

/* 
 * INDEX: [regNacIxAk] 
 */

CREATE UNIQUE INDEX [regNacIxAk] ON [ibge].[regioesNacoes]([nacID], [regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesNacoes') AND name='regNacIxAk')
    PRINT '<<< CREATED INDEX ibge.regioesNacoes.regNacIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.regioesNacoes.regNacIxAk >>>'
go

/* 
 * INDEX: [regNacIxFkNac] 
 */

CREATE INDEX [regNacIxFkNac] ON [ibge].[regioesNacoes]([nacID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesNacoes') AND name='regNacIxFkNac')
    PRINT '<<< CREATED INDEX ibge.regioesNacoes.regNacIxFkNac >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.regioesNacoes.regNacIxFkNac >>>'
go

/* 
 * INDEX: [regNacIxFkReg] 
 */

CREATE INDEX [regNacIxFkReg] ON [ibge].[regioesNacoes]([regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesNacoes') AND name='regNacIxFkReg')
    PRINT '<<< CREATED INDEX ibge.regioesNacoes.regNacIxFkReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.regioesNacoes.regNacIxFkReg >>>'
go

/* 
 * INDEX: [regNacFkNac] 
 */

CREATE INDEX [regNacFkNac] ON [ibge].[regioesNacoes]([nacID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesNacoes') AND name='regNacFkNac')
    PRINT '<<< CREATED INDEX ibge.regioesNacoes.regNacFkNac >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.regioesNacoes.regNacFkNac >>>'
go

/* 
 * INDEX: [regNacFkReg] 
 */

CREATE INDEX [regNacFkReg] ON [ibge].[regioesNacoes]([regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesNacoes') AND name='regNacFkReg')
    PRINT '<<< CREATED INDEX ibge.regioesNacoes.regNacFkReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.regioesNacoes.regNacFkReg >>>'
go

