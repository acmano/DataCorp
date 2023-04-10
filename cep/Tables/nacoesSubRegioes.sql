IF OBJECT_ID('[nacoesSubRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [nacoesSubRegioes]
    PRINT '<<< DROPPED TABLE [nacoesSubRegioes] >>>'
END
go
/* 
 * TABLE: [nacoesSubRegioes] 
 */

CREATE TABLE [nacoesSubRegioes](
    [nacSubRegID]  int    IDENTITY(1,1),
    [nacID]        int    NOT NULL,
    [subRegID]     int    NOT NULL
)
go



IF OBJECT_ID('nacoesSubRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE nacoesSubRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE nacoesSubRegioes >>>'
go

/* 
 * TABLE: [nacoesSubRegioes] 
 */

ALTER TABLE [nacoesSubRegioes] ADD 
    CONSTRAINT [nacSubRegIxPk] PRIMARY KEY CLUSTERED ([nacSubRegID])
go

IF OBJECT_ID('nacoesSubRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE nacoesSubRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE nacoesSubRegioes >>>'
go

/* 
 * INDEX: [nacSubRegIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesSubRegioes') AND name='nacSubRegIxAk')
BEGIN
    DROP INDEX [nacoesSubRegioes].[nacSubRegIxAk]
    PRINT '<<< DROPPED INDEX [nacoesSubRegioes].[nacSubRegIxAk] >>>'
END
go

/* 
 * INDEX: [nacSubRegIxFkNac] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesSubRegioes') AND name='nacSubRegIxFkNac')
BEGIN
    DROP INDEX [nacoesSubRegioes].[nacSubRegIxFkNac]
    PRINT '<<< DROPPED INDEX [nacoesSubRegioes].[nacSubRegIxFkNac] >>>'
END
go

/* 
 * INDEX: [nacFkNacSubReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesSubRegioes') AND name='nacFkNacSubReg')
BEGIN
    DROP INDEX [nacoesSubRegioes].[nacFkNacSubReg]
    PRINT '<<< DROPPED INDEX [nacoesSubRegioes].[nacFkNacSubReg] >>>'
END
go

/* 
 * INDEX: [subRegFkNacSubReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesSubRegioes') AND name='subRegFkNacSubReg')
BEGIN
    DROP INDEX [nacoesSubRegioes].[subRegFkNacSubReg]
    PRINT '<<< DROPPED INDEX [nacoesSubRegioes].[subRegFkNacSubReg] >>>'
END
go

/* 
 * INDEX: [nacSubRegIxAk] 
 */

CREATE UNIQUE INDEX [nacSubRegIxAk] ON [nacoesSubRegioes]([subRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesSubRegioes') AND name='nacSubRegIxAk')
    PRINT '<<< CREATED INDEX nacoesSubRegioes.nacSubRegIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX nacoesSubRegioes.nacSubRegIxAk >>>'
go

/* 
 * INDEX: [nacSubRegIxFkNac] 
 */

CREATE INDEX [nacSubRegIxFkNac] ON [nacoesSubRegioes]([nacID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesSubRegioes') AND name='nacSubRegIxFkNac')
    PRINT '<<< CREATED INDEX nacoesSubRegioes.nacSubRegIxFkNac >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX nacoesSubRegioes.nacSubRegIxFkNac >>>'
go

/* 
 * INDEX: [nacFkNacSubReg] 
 */

CREATE INDEX [nacFkNacSubReg] ON [nacoesSubRegioes]([nacID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesSubRegioes') AND name='nacFkNacSubReg')
    PRINT '<<< CREATED INDEX nacoesSubRegioes.nacFkNacSubReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX nacoesSubRegioes.nacFkNacSubReg >>>'
go

/* 
 * INDEX: [subRegFkNacSubReg] 
 */

CREATE INDEX [subRegFkNacSubReg] ON [nacoesSubRegioes]([subRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesSubRegioes') AND name='subRegFkNacSubReg')
    PRINT '<<< CREATED INDEX nacoesSubRegioes.subRegFkNacSubReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX nacoesSubRegioes.subRegFkNacSubReg >>>'
go

