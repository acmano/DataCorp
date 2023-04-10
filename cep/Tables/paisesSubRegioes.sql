IF OBJECT_ID('[paisesSubRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [paisesSubRegioes]
    PRINT '<<< DROPPED TABLE [paisesSubRegioes] >>>'
END
go
/* 
 * TABLE: [paisesSubRegioes] 
 */

CREATE TABLE [paisesSubRegioes](
    [paiSubRegID]  int    IDENTITY(1,1),
    [paiID]        int    NOT NULL,
    [subRegID]     int    NOT NULL
)
go



IF OBJECT_ID('paisesSubRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE paisesSubRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE paisesSubRegioes >>>'
go

/* 
 * TABLE: [paisesSubRegioes] 
 */

ALTER TABLE [paisesSubRegioes] ADD 
    CONSTRAINT [paiSubRegIxPk] PRIMARY KEY CLUSTERED ([paiSubRegID])
go

IF OBJECT_ID('paisesSubRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE paisesSubRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE paisesSubRegioes >>>'
go

/* 
 * INDEX: [paiSubRegIxFkReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('paisesSubRegioes') AND name='paiSubRegIxFkReg')
BEGIN
    DROP INDEX [paisesSubRegioes].[paiSubRegIxFkReg]
    PRINT '<<< DROPPED INDEX [paisesSubRegioes].[paiSubRegIxFkReg] >>>'
END
go

/* 
 * INDEX: [paiSubRegIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('paisesSubRegioes') AND name='paiSubRegIxAk')
BEGIN
    DROP INDEX [paisesSubRegioes].[paiSubRegIxAk]
    PRINT '<<< DROPPED INDEX [paisesSubRegioes].[paiSubRegIxAk] >>>'
END
go

/* 
 * INDEX: [subRegFkPaiSubReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('paisesSubRegioes') AND name='subRegFkPaiSubReg')
BEGIN
    DROP INDEX [paisesSubRegioes].[subRegFkPaiSubReg]
    PRINT '<<< DROPPED INDEX [paisesSubRegioes].[subRegFkPaiSubReg] >>>'
END
go

/* 
 * INDEX: [paiFkPaiSubReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('paisesSubRegioes') AND name='paiFkPaiSubReg')
BEGIN
    DROP INDEX [paisesSubRegioes].[paiFkPaiSubReg]
    PRINT '<<< DROPPED INDEX [paisesSubRegioes].[paiFkPaiSubReg] >>>'
END
go

/* 
 * INDEX: [paiSubRegIxFkReg] 
 */

CREATE INDEX [paiSubRegIxFkReg] ON [paisesSubRegioes]([subRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('paisesSubRegioes') AND name='paiSubRegIxFkReg')
    PRINT '<<< CREATED INDEX paisesSubRegioes.paiSubRegIxFkReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX paisesSubRegioes.paiSubRegIxFkReg >>>'
go

/* 
 * INDEX: [paiSubRegIxAk] 
 */

CREATE UNIQUE INDEX [paiSubRegIxAk] ON [paisesSubRegioes]([paiID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('paisesSubRegioes') AND name='paiSubRegIxAk')
    PRINT '<<< CREATED INDEX paisesSubRegioes.paiSubRegIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX paisesSubRegioes.paiSubRegIxAk >>>'
go

/* 
 * INDEX: [subRegFkPaiSubReg] 
 */

CREATE INDEX [subRegFkPaiSubReg] ON [paisesSubRegioes]([subRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('paisesSubRegioes') AND name='subRegFkPaiSubReg')
    PRINT '<<< CREATED INDEX paisesSubRegioes.subRegFkPaiSubReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX paisesSubRegioes.subRegFkPaiSubReg >>>'
go

/* 
 * INDEX: [paiFkPaiSubReg] 
 */

CREATE INDEX [paiFkPaiSubReg] ON [paisesSubRegioes]([paiID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('paisesSubRegioes') AND name='paiFkPaiSubReg')
    PRINT '<<< CREATED INDEX paisesSubRegioes.paiFkPaiSubReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX paisesSubRegioes.paiFkPaiSubReg >>>'
go

