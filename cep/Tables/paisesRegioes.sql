IF OBJECT_ID('[paisesRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [paisesRegioes]
    PRINT '<<< DROPPED TABLE [paisesRegioes] >>>'
END
go
/* 
 * TABLE: [paisesRegioes] 
 */

CREATE TABLE [paisesRegioes](
    [paiRegID]  int    IDENTITY(1,1),
    [paiID]     int    NOT NULL,
    [regID]     int    NOT NULL
)
go



IF OBJECT_ID('paisesRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE paisesRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE paisesRegioes >>>'
go

/* 
 * TABLE: [paisesRegioes] 
 */

ALTER TABLE [paisesRegioes] ADD 
    CONSTRAINT [paiRegIxPk] PRIMARY KEY CLUSTERED ([paiRegID])
go

IF OBJECT_ID('paisesRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE paisesRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE paisesRegioes >>>'
go

/* 
 * INDEX: [paiRegIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('paisesRegioes') AND name='paiRegIxAk')
BEGIN
    DROP INDEX [paisesRegioes].[paiRegIxAk]
    PRINT '<<< DROPPED INDEX [paisesRegioes].[paiRegIxAk] >>>'
END
go

/* 
 * INDEX: [paiRegIxFkReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('paisesRegioes') AND name='paiRegIxFkReg')
BEGIN
    DROP INDEX [paisesRegioes].[paiRegIxFkReg]
    PRINT '<<< DROPPED INDEX [paisesRegioes].[paiRegIxFkReg] >>>'
END
go

/* 
 * INDEX: [paiFkPaiReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('paisesRegioes') AND name='paiFkPaiReg')
BEGIN
    DROP INDEX [paisesRegioes].[paiFkPaiReg]
    PRINT '<<< DROPPED INDEX [paisesRegioes].[paiFkPaiReg] >>>'
END
go

/* 
 * INDEX: [regFkPaiReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('paisesRegioes') AND name='regFkPaiReg')
BEGIN
    DROP INDEX [paisesRegioes].[regFkPaiReg]
    PRINT '<<< DROPPED INDEX [paisesRegioes].[regFkPaiReg] >>>'
END
go

/* 
 * INDEX: [paiRegIxAk] 
 */

CREATE UNIQUE INDEX [paiRegIxAk] ON [paisesRegioes]([paiID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('paisesRegioes') AND name='paiRegIxAk')
    PRINT '<<< CREATED INDEX paisesRegioes.paiRegIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX paisesRegioes.paiRegIxAk >>>'
go

/* 
 * INDEX: [paiRegIxFkReg] 
 */

CREATE INDEX [paiRegIxFkReg] ON [paisesRegioes]([regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('paisesRegioes') AND name='paiRegIxFkReg')
    PRINT '<<< CREATED INDEX paisesRegioes.paiRegIxFkReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX paisesRegioes.paiRegIxFkReg >>>'
go

/* 
 * INDEX: [paiFkPaiReg] 
 */

CREATE INDEX [paiFkPaiReg] ON [paisesRegioes]([paiID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('paisesRegioes') AND name='paiFkPaiReg')
    PRINT '<<< CREATED INDEX paisesRegioes.paiFkPaiReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX paisesRegioes.paiFkPaiReg >>>'
go

/* 
 * INDEX: [regFkPaiReg] 
 */

CREATE INDEX [regFkPaiReg] ON [paisesRegioes]([regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('paisesRegioes') AND name='regFkPaiReg')
    PRINT '<<< CREATED INDEX paisesRegioes.regFkPaiReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX paisesRegioes.regFkPaiReg >>>'
go

