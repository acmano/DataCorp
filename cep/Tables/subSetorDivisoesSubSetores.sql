IF OBJECT_ID('[subSetorDivisoesSubSetores]') IS NOT NULL
BEGIN
    DROP TABLE [subSetorDivisoesSubSetores]
    PRINT '<<< DROPPED TABLE [subSetorDivisoesSubSetores] >>>'
END
go
/* 
 * TABLE: [subSetorDivisoesSubSetores] 
 */

CREATE TABLE [subSetorDivisoesSubSetores](
    [subSetDivSubSetID]  int    IDENTITY(1,1),
    [subSetID]           int    NOT NULL,
    [subSetDivID]        int    NOT NULL
)
go



IF OBJECT_ID('subSetorDivisoesSubSetores') IS NOT NULL
    PRINT '<<< CREATED TABLE subSetorDivisoesSubSetores >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE subSetorDivisoesSubSetores >>>'
go

/* 
 * TABLE: [subSetorDivisoesSubSetores] 
 */

ALTER TABLE [subSetorDivisoesSubSetores] ADD 
    CONSTRAINT [subSetDivSubSetIxPk] PRIMARY KEY CLUSTERED ([subSetDivSubSetID])
go

IF OBJECT_ID('subSetorDivisoesSubSetores') IS NOT NULL
    PRINT '<<< CREATED TABLE subSetorDivisoesSubSetores >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE subSetorDivisoesSubSetores >>>'
go

/* 
 * INDEX: [subSetDivSubSetIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subSetorDivisoesSubSetores') AND name='subSetDivSubSetIxAk')
BEGIN
    DROP INDEX [subSetorDivisoesSubSetores].[subSetDivSubSetIxAk]
    PRINT '<<< DROPPED INDEX [subSetorDivisoesSubSetores].[subSetDivSubSetIxAk] >>>'
END
go

/* 
 * INDEX: [subSetDivSubSetIxFkSubSet] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subSetorDivisoesSubSetores') AND name='subSetDivSubSetIxFkSubSet')
BEGIN
    DROP INDEX [subSetorDivisoesSubSetores].[subSetDivSubSetIxFkSubSet]
    PRINT '<<< DROPPED INDEX [subSetorDivisoesSubSetores].[subSetDivSubSetIxFkSubSet] >>>'
END
go

/* 
 * INDEX: [subSetDivSubSetIxFkSeubSetDiv] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subSetorDivisoesSubSetores') AND name='subSetDivSubSetIxFkSeubSetDiv')
BEGIN
    DROP INDEX [subSetorDivisoesSubSetores].[subSetDivSubSetIxFkSeubSetDiv]
    PRINT '<<< DROPPED INDEX [subSetorDivisoesSubSetores].[subSetDivSubSetIxFkSeubSetDiv] >>>'
END
go

/* 
 * INDEX: [subSetDivSubSetFkSubSet] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subSetorDivisoesSubSetores') AND name='subSetDivSubSetFkSubSet')
BEGIN
    DROP INDEX [subSetorDivisoesSubSetores].[subSetDivSubSetFkSubSet]
    PRINT '<<< DROPPED INDEX [subSetorDivisoesSubSetores].[subSetDivSubSetFkSubSet] >>>'
END
go

/* 
 * INDEX: [subSetDivSubSetFkSubSetDiv] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subSetorDivisoesSubSetores') AND name='subSetDivSubSetFkSubSetDiv')
BEGIN
    DROP INDEX [subSetorDivisoesSubSetores].[subSetDivSubSetFkSubSetDiv]
    PRINT '<<< DROPPED INDEX [subSetorDivisoesSubSetores].[subSetDivSubSetFkSubSetDiv] >>>'
END
go

/* 
 * INDEX: [subSetDivSubSetIxAk] 
 */

CREATE UNIQUE INDEX [subSetDivSubSetIxAk] ON [subSetorDivisoesSubSetores]([subSetID], [subSetDivID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subSetorDivisoesSubSetores') AND name='subSetDivSubSetIxAk')
    PRINT '<<< CREATED INDEX subSetorDivisoesSubSetores.subSetDivSubSetIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX subSetorDivisoesSubSetores.subSetDivSubSetIxAk >>>'
go

/* 
 * INDEX: [subSetDivSubSetIxFkSubSet] 
 */

CREATE INDEX [subSetDivSubSetIxFkSubSet] ON [subSetorDivisoesSubSetores]([subSetID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subSetorDivisoesSubSetores') AND name='subSetDivSubSetIxFkSubSet')
    PRINT '<<< CREATED INDEX subSetorDivisoesSubSetores.subSetDivSubSetIxFkSubSet >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX subSetorDivisoesSubSetores.subSetDivSubSetIxFkSubSet >>>'
go

/* 
 * INDEX: [subSetDivSubSetIxFkSeubSetDiv] 
 */

CREATE INDEX [subSetDivSubSetIxFkSeubSetDiv] ON [subSetorDivisoesSubSetores]([subSetDivID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subSetorDivisoesSubSetores') AND name='subSetDivSubSetIxFkSeubSetDiv')
    PRINT '<<< CREATED INDEX subSetorDivisoesSubSetores.subSetDivSubSetIxFkSeubSetDiv >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX subSetorDivisoesSubSetores.subSetDivSubSetIxFkSeubSetDiv >>>'
go

/* 
 * INDEX: [subSetDivSubSetFkSubSet] 
 */

CREATE INDEX [subSetDivSubSetFkSubSet] ON [subSetorDivisoesSubSetores]([subSetID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subSetorDivisoesSubSetores') AND name='subSetDivSubSetFkSubSet')
    PRINT '<<< CREATED INDEX subSetorDivisoesSubSetores.subSetDivSubSetFkSubSet >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX subSetorDivisoesSubSetores.subSetDivSubSetFkSubSet >>>'
go

/* 
 * INDEX: [subSetDivSubSetFkSubSetDiv] 
 */

CREATE INDEX [subSetDivSubSetFkSubSetDiv] ON [subSetorDivisoesSubSetores]([subSetDivID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subSetorDivisoesSubSetores') AND name='subSetDivSubSetFkSubSetDiv')
    PRINT '<<< CREATED INDEX subSetorDivisoesSubSetores.subSetDivSubSetFkSubSetDiv >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX subSetorDivisoesSubSetores.subSetDivSubSetFkSubSetDiv >>>'
go

