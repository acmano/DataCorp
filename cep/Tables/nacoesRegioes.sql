IF OBJECT_ID('[nacoesRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [nacoesRegioes]
    PRINT '<<< DROPPED TABLE [nacoesRegioes] >>>'
END
go
/* 
 * TABLE: [nacoesRegioes] 
 */

CREATE TABLE [nacoesRegioes](
    [nacRegID]  int    IDENTITY(1,1),
    [nacID]     int    NOT NULL,
    [regID]     int    NOT NULL
)
go



IF OBJECT_ID('nacoesRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE nacoesRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE nacoesRegioes >>>'
go

/* 
 * TABLE: [nacoesRegioes] 
 */

ALTER TABLE [nacoesRegioes] ADD 
    CONSTRAINT [nacRegIxPk] PRIMARY KEY CLUSTERED ([nacRegID])
go

IF OBJECT_ID('nacoesRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE nacoesRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE nacoesRegioes >>>'
go

/* 
 * INDEX: [nacRegIxFkNac] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesRegioes') AND name='nacRegIxFkNac')
BEGIN
    DROP INDEX [nacoesRegioes].[nacRegIxFkNac]
    PRINT '<<< DROPPED INDEX [nacoesRegioes].[nacRegIxFkNac] >>>'
END
go

/* 
 * INDEX: [nacRegIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesRegioes') AND name='nacRegIxAk')
BEGIN
    DROP INDEX [nacoesRegioes].[nacRegIxAk]
    PRINT '<<< DROPPED INDEX [nacoesRegioes].[nacRegIxAk] >>>'
END
go

/* 
 * INDEX: [nacFkEntReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesRegioes') AND name='nacFkEntReg')
BEGIN
    DROP INDEX [nacoesRegioes].[nacFkEntReg]
    PRINT '<<< DROPPED INDEX [nacoesRegioes].[nacFkEntReg] >>>'
END
go

/* 
 * INDEX: [regFkNacReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesRegioes') AND name='regFkNacReg')
BEGIN
    DROP INDEX [nacoesRegioes].[regFkNacReg]
    PRINT '<<< DROPPED INDEX [nacoesRegioes].[regFkNacReg] >>>'
END
go

/* 
 * INDEX: [nacRegIxFkNac] 
 */

CREATE INDEX [nacRegIxFkNac] ON [nacoesRegioes]([nacID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesRegioes') AND name='nacRegIxFkNac')
    PRINT '<<< CREATED INDEX nacoesRegioes.nacRegIxFkNac >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX nacoesRegioes.nacRegIxFkNac >>>'
go

/* 
 * INDEX: [nacRegIxAk] 
 */

CREATE UNIQUE INDEX [nacRegIxAk] ON [nacoesRegioes]([regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesRegioes') AND name='nacRegIxAk')
    PRINT '<<< CREATED INDEX nacoesRegioes.nacRegIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX nacoesRegioes.nacRegIxAk >>>'
go

/* 
 * INDEX: [nacFkEntReg] 
 */

CREATE INDEX [nacFkEntReg] ON [nacoesRegioes]([nacID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesRegioes') AND name='nacFkEntReg')
    PRINT '<<< CREATED INDEX nacoesRegioes.nacFkEntReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX nacoesRegioes.nacFkEntReg >>>'
go

/* 
 * INDEX: [regFkNacReg] 
 */

CREATE INDEX [regFkNacReg] ON [nacoesRegioes]([regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesRegioes') AND name='regFkNacReg')
    PRINT '<<< CREATED INDEX nacoesRegioes.regFkNacReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX nacoesRegioes.regFkNacReg >>>'
go

