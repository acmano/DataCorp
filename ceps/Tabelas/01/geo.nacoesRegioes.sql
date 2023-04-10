IF OBJECT_ID('[geo].[nacoesRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[nacoesRegioes]
    PRINT '<<< DROPPED TABLE [geo].[nacoesRegioes] >>>'
END
go
/* 
 * TABLE: [geo].[nacoesRegioes] 
 */

CREATE TABLE [geo].[nacoesRegioes](
    [nacRegID]  int    IDENTITY(1,1),
    [nacID]     int    NOT NULL,
    [regID]     int    NOT NULL
)
go



IF OBJECT_ID('geo.nacoesRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE geo.nacoesRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE geo.nacoesRegioes >>>'
go

/* 
 * TABLE: [geo].[nacoesRegioes] 
 */

ALTER TABLE [geo].[nacoesRegioes] ADD 
    CONSTRAINT [nacRegIxPk] PRIMARY KEY CLUSTERED ([nacRegID])
go

IF OBJECT_ID('geo.nacoesRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE geo.nacoesRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE geo.nacoesRegioes >>>'
go

/* 
 * INDEX: [nacRegIxFkNac] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesRegioes') AND name='nacRegIxFkNac')
BEGIN
    DROP INDEX [geo].[nacoesRegioes].[nacRegIxFkNac]
    PRINT '<<< DROPPED INDEX [geo].[nacoesRegioes].[nacRegIxFkNac] >>>'
END
go

/* 
 * INDEX: [nacRegIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesRegioes') AND name='nacRegIxAk')
BEGIN
    DROP INDEX [geo].[nacoesRegioes].[nacRegIxAk]
    PRINT '<<< DROPPED INDEX [geo].[nacoesRegioes].[nacRegIxAk] >>>'
END
go

/* 
 * INDEX: [nacFkEntReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesRegioes') AND name='nacFkEntReg')
BEGIN
    DROP INDEX [geo].[nacoesRegioes].[nacFkEntReg]
    PRINT '<<< DROPPED INDEX [geo].[nacoesRegioes].[nacFkEntReg] >>>'
END
go

/* 
 * INDEX: [regFkNacReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesRegioes') AND name='regFkNacReg')
BEGIN
    DROP INDEX [geo].[nacoesRegioes].[regFkNacReg]
    PRINT '<<< DROPPED INDEX [geo].[nacoesRegioes].[regFkNacReg] >>>'
END
go

/* 
 * INDEX: [nacRegIxFkNac] 
 */

CREATE INDEX [nacRegIxFkNac] ON [geo].[nacoesRegioes]([nacID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesRegioes') AND name='nacRegIxFkNac')
    PRINT '<<< CREATED INDEX geo.nacoesRegioes.nacRegIxFkNac >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.nacoesRegioes.nacRegIxFkNac >>>'
go

/* 
 * INDEX: [nacRegIxAk] 
 */

CREATE UNIQUE INDEX [nacRegIxAk] ON [geo].[nacoesRegioes]([regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesRegioes') AND name='nacRegIxAk')
    PRINT '<<< CREATED INDEX geo.nacoesRegioes.nacRegIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.nacoesRegioes.nacRegIxAk >>>'
go

/* 
 * INDEX: [nacFkEntReg] 
 */

CREATE INDEX [nacFkEntReg] ON [geo].[nacoesRegioes]([nacID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesRegioes') AND name='nacFkEntReg')
    PRINT '<<< CREATED INDEX geo.nacoesRegioes.nacFkEntReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.nacoesRegioes.nacFkEntReg >>>'
go

/* 
 * INDEX: [regFkNacReg] 
 */

CREATE INDEX [regFkNacReg] ON [geo].[nacoesRegioes]([regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesRegioes') AND name='regFkNacReg')
    PRINT '<<< CREATED INDEX geo.nacoesRegioes.regFkNacReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.nacoesRegioes.regFkNacReg >>>'
go

