IF OBJECT_ID('[geo].[paisesRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[paisesRegioes]
    PRINT '<<< DROPPED TABLE [geo].[paisesRegioes] >>>'
END
go
/* 
 * TABLE: [geo].[paisesRegioes] 
 */

CREATE TABLE [geo].[paisesRegioes](
    [paiRegID]  int    IDENTITY(1,1),
    [paiID]     int    NOT NULL,
    [regID]     int    NOT NULL
)
go



IF OBJECT_ID('geo.paisesRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE geo.paisesRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE geo.paisesRegioes >>>'
go

/* 
 * TABLE: [geo].[paisesRegioes] 
 */

ALTER TABLE [geo].[paisesRegioes] ADD 
    CONSTRAINT [paiRegIxPk] PRIMARY KEY CLUSTERED ([paiRegID])
go

IF OBJECT_ID('geo.paisesRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE geo.paisesRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE geo.paisesRegioes >>>'
go

/* 
 * INDEX: [paiRegIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paisesRegioes') AND name='paiRegIxAk')
BEGIN
    DROP INDEX [geo].[paisesRegioes].[paiRegIxAk]
    PRINT '<<< DROPPED INDEX [geo].[paisesRegioes].[paiRegIxAk] >>>'
END
go

/* 
 * INDEX: [paiRegIxFkReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paisesRegioes') AND name='paiRegIxFkReg')
BEGIN
    DROP INDEX [geo].[paisesRegioes].[paiRegIxFkReg]
    PRINT '<<< DROPPED INDEX [geo].[paisesRegioes].[paiRegIxFkReg] >>>'
END
go

/* 
 * INDEX: [paiFkPaiReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paisesRegioes') AND name='paiFkPaiReg')
BEGIN
    DROP INDEX [geo].[paisesRegioes].[paiFkPaiReg]
    PRINT '<<< DROPPED INDEX [geo].[paisesRegioes].[paiFkPaiReg] >>>'
END
go

/* 
 * INDEX: [regFkPaiReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paisesRegioes') AND name='regFkPaiReg')
BEGIN
    DROP INDEX [geo].[paisesRegioes].[regFkPaiReg]
    PRINT '<<< DROPPED INDEX [geo].[paisesRegioes].[regFkPaiReg] >>>'
END
go

/* 
 * INDEX: [paiRegIxAk] 
 */

CREATE UNIQUE INDEX [paiRegIxAk] ON [geo].[paisesRegioes]([paiID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paisesRegioes') AND name='paiRegIxAk')
    PRINT '<<< CREATED INDEX geo.paisesRegioes.paiRegIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.paisesRegioes.paiRegIxAk >>>'
go

/* 
 * INDEX: [paiRegIxFkReg] 
 */

CREATE INDEX [paiRegIxFkReg] ON [geo].[paisesRegioes]([regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paisesRegioes') AND name='paiRegIxFkReg')
    PRINT '<<< CREATED INDEX geo.paisesRegioes.paiRegIxFkReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.paisesRegioes.paiRegIxFkReg >>>'
go

/* 
 * INDEX: [paiFkPaiReg] 
 */

CREATE INDEX [paiFkPaiReg] ON [geo].[paisesRegioes]([paiID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paisesRegioes') AND name='paiFkPaiReg')
    PRINT '<<< CREATED INDEX geo.paisesRegioes.paiFkPaiReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.paisesRegioes.paiFkPaiReg >>>'
go

/* 
 * INDEX: [regFkPaiReg] 
 */

CREATE INDEX [regFkPaiReg] ON [geo].[paisesRegioes]([regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paisesRegioes') AND name='regFkPaiReg')
    PRINT '<<< CREATED INDEX geo.paisesRegioes.regFkPaiReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.paisesRegioes.regFkPaiReg >>>'
go

