IF OBJECT_ID('[subRegioesRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [subRegioesRegioes]
    PRINT '<<< DROPPED TABLE [subRegioesRegioes] >>>'
END
go
/* 
 * TABLE: [subRegioesRegioes] 
 */

CREATE TABLE [subRegioesRegioes](
    [subRegRegID]  int    IDENTITY(1,1),
    [regID]        int    NOT NULL,
    [subRegID]     int    NOT NULL
)
go



IF OBJECT_ID('subRegioesRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE subRegioesRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE subRegioesRegioes >>>'
go

/* 
 * TABLE: [subRegioesRegioes] 
 */

ALTER TABLE [subRegioesRegioes] ADD 
    CONSTRAINT [subRegRegIxPk] PRIMARY KEY CLUSTERED ([subRegRegID])
go

IF OBJECT_ID('subRegioesRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE subRegioesRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE subRegioesRegioes >>>'
go

/* 
 * INDEX: [subRegRegIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subRegioesRegioes') AND name='subRegRegIxAk')
BEGIN
    DROP INDEX [subRegioesRegioes].[subRegRegIxAk]
    PRINT '<<< DROPPED INDEX [subRegioesRegioes].[subRegRegIxAk] >>>'
END
go

/* 
 * INDEX: [subRegRegIxFkReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subRegioesRegioes') AND name='subRegRegIxFkReg')
BEGIN
    DROP INDEX [subRegioesRegioes].[subRegRegIxFkReg]
    PRINT '<<< DROPPED INDEX [subRegioesRegioes].[subRegRegIxFkReg] >>>'
END
go

/* 
 * INDEX: [regFkSubRegReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subRegioesRegioes') AND name='regFkSubRegReg')
BEGIN
    DROP INDEX [subRegioesRegioes].[regFkSubRegReg]
    PRINT '<<< DROPPED INDEX [subRegioesRegioes].[regFkSubRegReg] >>>'
END
go

/* 
 * INDEX: [subRegFkSubRegReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subRegioesRegioes') AND name='subRegFkSubRegReg')
BEGIN
    DROP INDEX [subRegioesRegioes].[subRegFkSubRegReg]
    PRINT '<<< DROPPED INDEX [subRegioesRegioes].[subRegFkSubRegReg] >>>'
END
go

/* 
 * INDEX: [subRegRegIxAk] 
 */

CREATE UNIQUE INDEX [subRegRegIxAk] ON [subRegioesRegioes]([subRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subRegioesRegioes') AND name='subRegRegIxAk')
    PRINT '<<< CREATED INDEX subRegioesRegioes.subRegRegIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX subRegioesRegioes.subRegRegIxAk >>>'
go

/* 
 * INDEX: [subRegRegIxFkReg] 
 */

CREATE INDEX [subRegRegIxFkReg] ON [subRegioesRegioes]([regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subRegioesRegioes') AND name='subRegRegIxFkReg')
    PRINT '<<< CREATED INDEX subRegioesRegioes.subRegRegIxFkReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX subRegioesRegioes.subRegRegIxFkReg >>>'
go

/* 
 * INDEX: [regFkSubRegReg] 
 */

CREATE INDEX [regFkSubRegReg] ON [subRegioesRegioes]([regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subRegioesRegioes') AND name='regFkSubRegReg')
    PRINT '<<< CREATED INDEX subRegioesRegioes.regFkSubRegReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX subRegioesRegioes.regFkSubRegReg >>>'
go

/* 
 * INDEX: [subRegFkSubRegReg] 
 */

CREATE INDEX [subRegFkSubRegReg] ON [subRegioesRegioes]([subRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subRegioesRegioes') AND name='subRegFkSubRegReg')
    PRINT '<<< CREATED INDEX subRegioesRegioes.subRegFkSubRegReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX subRegioesRegioes.subRegFkSubRegReg >>>'
go

