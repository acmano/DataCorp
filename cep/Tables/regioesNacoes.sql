IF OBJECT_ID('[regioesNacoes]') IS NOT NULL
BEGIN
    DROP TABLE [regioesNacoes]
    PRINT '<<< DROPPED TABLE [regioesNacoes] >>>'
END
go
/* 
 * TABLE: [regioesNacoes] 
 */

CREATE TABLE [regioesNacoes](
    [regNacID]  int    IDENTITY(1,1),
    [nacID]     int    NOT NULL,
    [regID]     int    NOT NULL
)
go



IF OBJECT_ID('regioesNacoes') IS NOT NULL
    PRINT '<<< CREATED TABLE regioesNacoes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE regioesNacoes >>>'
go

/* 
 * TABLE: [regioesNacoes] 
 */

ALTER TABLE [regioesNacoes] ADD 
    CONSTRAINT [regNacIxPk] PRIMARY KEY CLUSTERED ([regNacID])
go

IF OBJECT_ID('regioesNacoes') IS NOT NULL
    PRINT '<<< CREATED TABLE regioesNacoes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE regioesNacoes >>>'
go

/* 
 * INDEX: [regNacIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesNacoes') AND name='regNacIxAk')
BEGIN
    DROP INDEX [regioesNacoes].[regNacIxAk]
    PRINT '<<< DROPPED INDEX [regioesNacoes].[regNacIxAk] >>>'
END
go

/* 
 * INDEX: [regNacIxFkNac] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesNacoes') AND name='regNacIxFkNac')
BEGIN
    DROP INDEX [regioesNacoes].[regNacIxFkNac]
    PRINT '<<< DROPPED INDEX [regioesNacoes].[regNacIxFkNac] >>>'
END
go

/* 
 * INDEX: [regNacIxFkReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesNacoes') AND name='regNacIxFkReg')
BEGIN
    DROP INDEX [regioesNacoes].[regNacIxFkReg]
    PRINT '<<< DROPPED INDEX [regioesNacoes].[regNacIxFkReg] >>>'
END
go

/* 
 * INDEX: [regNacFkNac] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesNacoes') AND name='regNacFkNac')
BEGIN
    DROP INDEX [regioesNacoes].[regNacFkNac]
    PRINT '<<< DROPPED INDEX [regioesNacoes].[regNacFkNac] >>>'
END
go

/* 
 * INDEX: [regNacFkReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesNacoes') AND name='regNacFkReg')
BEGIN
    DROP INDEX [regioesNacoes].[regNacFkReg]
    PRINT '<<< DROPPED INDEX [regioesNacoes].[regNacFkReg] >>>'
END
go

/* 
 * INDEX: [regNacIxAk] 
 */

CREATE UNIQUE INDEX [regNacIxAk] ON [regioesNacoes]([nacID], [regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesNacoes') AND name='regNacIxAk')
    PRINT '<<< CREATED INDEX regioesNacoes.regNacIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX regioesNacoes.regNacIxAk >>>'
go

/* 
 * INDEX: [regNacIxFkNac] 
 */

CREATE INDEX [regNacIxFkNac] ON [regioesNacoes]([nacID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesNacoes') AND name='regNacIxFkNac')
    PRINT '<<< CREATED INDEX regioesNacoes.regNacIxFkNac >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX regioesNacoes.regNacIxFkNac >>>'
go

/* 
 * INDEX: [regNacIxFkReg] 
 */

CREATE INDEX [regNacIxFkReg] ON [regioesNacoes]([regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesNacoes') AND name='regNacIxFkReg')
    PRINT '<<< CREATED INDEX regioesNacoes.regNacIxFkReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX regioesNacoes.regNacIxFkReg >>>'
go

/* 
 * INDEX: [regNacFkNac] 
 */

CREATE INDEX [regNacFkNac] ON [regioesNacoes]([nacID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesNacoes') AND name='regNacFkNac')
    PRINT '<<< CREATED INDEX regioesNacoes.regNacFkNac >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX regioesNacoes.regNacFkNac >>>'
go

/* 
 * INDEX: [regNacFkReg] 
 */

CREATE INDEX [regNacFkReg] ON [regioesNacoes]([regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesNacoes') AND name='regNacFkReg')
    PRINT '<<< CREATED INDEX regioesNacoes.regNacFkReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX regioesNacoes.regNacFkReg >>>'
go

