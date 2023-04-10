IF OBJECT_ID('[geo].[nacoesSubRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[nacoesSubRegioes]
    PRINT '<<< DROPPED TABLE [geo].[nacoesSubRegioes] >>>'
END
go
/* 
 * TABLE: [geo].[nacoesSubRegioes] 
 */

CREATE TABLE [geo].[nacoesSubRegioes](
    [nacSubRegID]  int    IDENTITY(1,1),
    [nacID]        int    NOT NULL,
    [subRegID]     int    NOT NULL
)
go



IF OBJECT_ID('geo.nacoesSubRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE geo.nacoesSubRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE geo.nacoesSubRegioes >>>'
go

/* 
 * TABLE: [geo].[nacoesSubRegioes] 
 */

ALTER TABLE [geo].[nacoesSubRegioes] ADD 
    CONSTRAINT [nacSubRegIxPk] PRIMARY KEY CLUSTERED ([nacSubRegID])
go

IF OBJECT_ID('geo.nacoesSubRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE geo.nacoesSubRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE geo.nacoesSubRegioes >>>'
go

/* 
 * INDEX: [nacSubRegIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesSubRegioes') AND name='nacSubRegIxAk')
BEGIN
    DROP INDEX [geo].[nacoesSubRegioes].[nacSubRegIxAk]
    PRINT '<<< DROPPED INDEX [geo].[nacoesSubRegioes].[nacSubRegIxAk] >>>'
END
go

/* 
 * INDEX: [nacSubRegIxFkNac] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesSubRegioes') AND name='nacSubRegIxFkNac')
BEGIN
    DROP INDEX [geo].[nacoesSubRegioes].[nacSubRegIxFkNac]
    PRINT '<<< DROPPED INDEX [geo].[nacoesSubRegioes].[nacSubRegIxFkNac] >>>'
END
go

/* 
 * INDEX: [nacFkNacSubReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesSubRegioes') AND name='nacFkNacSubReg')
BEGIN
    DROP INDEX [geo].[nacoesSubRegioes].[nacFkNacSubReg]
    PRINT '<<< DROPPED INDEX [geo].[nacoesSubRegioes].[nacFkNacSubReg] >>>'
END
go

/* 
 * INDEX: [subRegFkNacSubReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesSubRegioes') AND name='subRegFkNacSubReg')
BEGIN
    DROP INDEX [geo].[nacoesSubRegioes].[subRegFkNacSubReg]
    PRINT '<<< DROPPED INDEX [geo].[nacoesSubRegioes].[subRegFkNacSubReg] >>>'
END
go

/* 
 * INDEX: [nacSubRegIxAk] 
 */

CREATE UNIQUE INDEX [nacSubRegIxAk] ON [geo].[nacoesSubRegioes]([subRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesSubRegioes') AND name='nacSubRegIxAk')
    PRINT '<<< CREATED INDEX geo.nacoesSubRegioes.nacSubRegIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.nacoesSubRegioes.nacSubRegIxAk >>>'
go

/* 
 * INDEX: [nacSubRegIxFkNac] 
 */

CREATE INDEX [nacSubRegIxFkNac] ON [geo].[nacoesSubRegioes]([nacID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesSubRegioes') AND name='nacSubRegIxFkNac')
    PRINT '<<< CREATED INDEX geo.nacoesSubRegioes.nacSubRegIxFkNac >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.nacoesSubRegioes.nacSubRegIxFkNac >>>'
go

/* 
 * INDEX: [nacFkNacSubReg] 
 */

CREATE INDEX [nacFkNacSubReg] ON [geo].[nacoesSubRegioes]([nacID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesSubRegioes') AND name='nacFkNacSubReg')
    PRINT '<<< CREATED INDEX geo.nacoesSubRegioes.nacFkNacSubReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.nacoesSubRegioes.nacFkNacSubReg >>>'
go

/* 
 * INDEX: [subRegFkNacSubReg] 
 */

CREATE INDEX [subRegFkNacSubReg] ON [geo].[nacoesSubRegioes]([subRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesSubRegioes') AND name='subRegFkNacSubReg')
    PRINT '<<< CREATED INDEX geo.nacoesSubRegioes.subRegFkNacSubReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.nacoesSubRegioes.subRegFkNacSubReg >>>'
go

