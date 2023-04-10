IF OBJECT_ID('[geo].[paisesSubRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[paisesSubRegioes]
    PRINT '<<< DROPPED TABLE [geo].[paisesSubRegioes] >>>'
END
go
/* 
 * TABLE: [geo].[paisesSubRegioes] 
 */

CREATE TABLE [geo].[paisesSubRegioes](
    [paiSubRegID]  int    IDENTITY(1,1),
    [paiID]        int    NOT NULL,
    [subRegID]     int    NOT NULL
)
go



IF OBJECT_ID('geo.paisesSubRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE geo.paisesSubRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE geo.paisesSubRegioes >>>'
go

/* 
 * TABLE: [geo].[paisesSubRegioes] 
 */

ALTER TABLE [geo].[paisesSubRegioes] ADD 
    CONSTRAINT [paiSubRegIxPk] PRIMARY KEY CLUSTERED ([paiSubRegID])
go

IF OBJECT_ID('geo.paisesSubRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE geo.paisesSubRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE geo.paisesSubRegioes >>>'
go

/* 
 * INDEX: [paiSubRegIxFkReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paisesSubRegioes') AND name='paiSubRegIxFkReg')
BEGIN
    DROP INDEX [geo].[paisesSubRegioes].[paiSubRegIxFkReg]
    PRINT '<<< DROPPED INDEX [geo].[paisesSubRegioes].[paiSubRegIxFkReg] >>>'
END
go

/* 
 * INDEX: [paiSubRegIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paisesSubRegioes') AND name='paiSubRegIxAk')
BEGIN
    DROP INDEX [geo].[paisesSubRegioes].[paiSubRegIxAk]
    PRINT '<<< DROPPED INDEX [geo].[paisesSubRegioes].[paiSubRegIxAk] >>>'
END
go

/* 
 * INDEX: [subRegFkPaiSubReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paisesSubRegioes') AND name='subRegFkPaiSubReg')
BEGIN
    DROP INDEX [geo].[paisesSubRegioes].[subRegFkPaiSubReg]
    PRINT '<<< DROPPED INDEX [geo].[paisesSubRegioes].[subRegFkPaiSubReg] >>>'
END
go

/* 
 * INDEX: [paiFkPaiSubReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paisesSubRegioes') AND name='paiFkPaiSubReg')
BEGIN
    DROP INDEX [geo].[paisesSubRegioes].[paiFkPaiSubReg]
    PRINT '<<< DROPPED INDEX [geo].[paisesSubRegioes].[paiFkPaiSubReg] >>>'
END
go

/* 
 * INDEX: [paiSubRegIxFkReg] 
 */

CREATE INDEX [paiSubRegIxFkReg] ON [geo].[paisesSubRegioes]([subRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paisesSubRegioes') AND name='paiSubRegIxFkReg')
    PRINT '<<< CREATED INDEX geo.paisesSubRegioes.paiSubRegIxFkReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.paisesSubRegioes.paiSubRegIxFkReg >>>'
go

/* 
 * INDEX: [paiSubRegIxAk] 
 */

CREATE UNIQUE INDEX [paiSubRegIxAk] ON [geo].[paisesSubRegioes]([paiID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paisesSubRegioes') AND name='paiSubRegIxAk')
    PRINT '<<< CREATED INDEX geo.paisesSubRegioes.paiSubRegIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.paisesSubRegioes.paiSubRegIxAk >>>'
go

/* 
 * INDEX: [subRegFkPaiSubReg] 
 */

CREATE INDEX [subRegFkPaiSubReg] ON [geo].[paisesSubRegioes]([subRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paisesSubRegioes') AND name='subRegFkPaiSubReg')
    PRINT '<<< CREATED INDEX geo.paisesSubRegioes.subRegFkPaiSubReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.paisesSubRegioes.subRegFkPaiSubReg >>>'
go

/* 
 * INDEX: [paiFkPaiSubReg] 
 */

CREATE INDEX [paiFkPaiSubReg] ON [geo].[paisesSubRegioes]([paiID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paisesSubRegioes') AND name='paiFkPaiSubReg')
    PRINT '<<< CREATED INDEX geo.paisesSubRegioes.paiFkPaiSubReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.paisesSubRegioes.paiFkPaiSubReg >>>'
go

