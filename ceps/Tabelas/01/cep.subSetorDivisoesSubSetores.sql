IF OBJECT_ID('[cep].[subSetorDivisoesSubSetores]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[subSetorDivisoesSubSetores]
    PRINT '<<< DROPPED TABLE [cep].[subSetorDivisoesSubSetores] >>>'
END
go
/* 
 * TABLE: [cep].[subSetorDivisoesSubSetores] 
 */

CREATE TABLE [cep].[subSetorDivisoesSubSetores](
    [subSetDivSubSetID]  int    IDENTITY(1,1),
    [subSetID]           int    NOT NULL,
    [subSetDivID]        int    NOT NULL
)
go



IF OBJECT_ID('cep.subSetorDivisoesSubSetores') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.subSetorDivisoesSubSetores >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.subSetorDivisoesSubSetores >>>'
go

/* 
 * TABLE: [cep].[subSetorDivisoesSubSetores] 
 */

ALTER TABLE [cep].[subSetorDivisoesSubSetores] ADD 
    CONSTRAINT [subSetDivSubSetIxPk] PRIMARY KEY CLUSTERED ([subSetDivSubSetID])
go

IF OBJECT_ID('cep.subSetorDivisoesSubSetores') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.subSetorDivisoesSubSetores >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.subSetorDivisoesSubSetores >>>'
go

/* 
 * INDEX: [subSetDivSubSetIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.subSetorDivisoesSubSetores') AND name='subSetDivSubSetIxAk')
BEGIN
    DROP INDEX [cep].[subSetorDivisoesSubSetores].[subSetDivSubSetIxAk]
    PRINT '<<< DROPPED INDEX [cep].[subSetorDivisoesSubSetores].[subSetDivSubSetIxAk] >>>'
END
go

/* 
 * INDEX: [subSetDivSubSetIxFkSubSet] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.subSetorDivisoesSubSetores') AND name='subSetDivSubSetIxFkSubSet')
BEGIN
    DROP INDEX [cep].[subSetorDivisoesSubSetores].[subSetDivSubSetIxFkSubSet]
    PRINT '<<< DROPPED INDEX [cep].[subSetorDivisoesSubSetores].[subSetDivSubSetIxFkSubSet] >>>'
END
go

/* 
 * INDEX: [subSetDivSubSetIxFkSeubSetDiv] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.subSetorDivisoesSubSetores') AND name='subSetDivSubSetIxFkSeubSetDiv')
BEGIN
    DROP INDEX [cep].[subSetorDivisoesSubSetores].[subSetDivSubSetIxFkSeubSetDiv]
    PRINT '<<< DROPPED INDEX [cep].[subSetorDivisoesSubSetores].[subSetDivSubSetIxFkSeubSetDiv] >>>'
END
go

/* 
 * INDEX: [subSetDivSubSetFkSubSet] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.subSetorDivisoesSubSetores') AND name='subSetDivSubSetFkSubSet')
BEGIN
    DROP INDEX [cep].[subSetorDivisoesSubSetores].[subSetDivSubSetFkSubSet]
    PRINT '<<< DROPPED INDEX [cep].[subSetorDivisoesSubSetores].[subSetDivSubSetFkSubSet] >>>'
END
go

/* 
 * INDEX: [subSetDivSubSetFkSubSetDiv] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.subSetorDivisoesSubSetores') AND name='subSetDivSubSetFkSubSetDiv')
BEGIN
    DROP INDEX [cep].[subSetorDivisoesSubSetores].[subSetDivSubSetFkSubSetDiv]
    PRINT '<<< DROPPED INDEX [cep].[subSetorDivisoesSubSetores].[subSetDivSubSetFkSubSetDiv] >>>'
END
go

/* 
 * INDEX: [subSetDivSubSetIxAk] 
 */

CREATE UNIQUE INDEX [subSetDivSubSetIxAk] ON [cep].[subSetorDivisoesSubSetores]([subSetID], [subSetDivID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.subSetorDivisoesSubSetores') AND name='subSetDivSubSetIxAk')
    PRINT '<<< CREATED INDEX cep.subSetorDivisoesSubSetores.subSetDivSubSetIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.subSetorDivisoesSubSetores.subSetDivSubSetIxAk >>>'
go

/* 
 * INDEX: [subSetDivSubSetIxFkSubSet] 
 */

CREATE INDEX [subSetDivSubSetIxFkSubSet] ON [cep].[subSetorDivisoesSubSetores]([subSetID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.subSetorDivisoesSubSetores') AND name='subSetDivSubSetIxFkSubSet')
    PRINT '<<< CREATED INDEX cep.subSetorDivisoesSubSetores.subSetDivSubSetIxFkSubSet >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.subSetorDivisoesSubSetores.subSetDivSubSetIxFkSubSet >>>'
go

/* 
 * INDEX: [subSetDivSubSetIxFkSeubSetDiv] 
 */

CREATE INDEX [subSetDivSubSetIxFkSeubSetDiv] ON [cep].[subSetorDivisoesSubSetores]([subSetDivID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.subSetorDivisoesSubSetores') AND name='subSetDivSubSetIxFkSeubSetDiv')
    PRINT '<<< CREATED INDEX cep.subSetorDivisoesSubSetores.subSetDivSubSetIxFkSeubSetDiv >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.subSetorDivisoesSubSetores.subSetDivSubSetIxFkSeubSetDiv >>>'
go

/* 
 * INDEX: [subSetDivSubSetFkSubSet] 
 */

CREATE INDEX [subSetDivSubSetFkSubSet] ON [cep].[subSetorDivisoesSubSetores]([subSetID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.subSetorDivisoesSubSetores') AND name='subSetDivSubSetFkSubSet')
    PRINT '<<< CREATED INDEX cep.subSetorDivisoesSubSetores.subSetDivSubSetFkSubSet >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.subSetorDivisoesSubSetores.subSetDivSubSetFkSubSet >>>'
go

/* 
 * INDEX: [subSetDivSubSetFkSubSetDiv] 
 */

CREATE INDEX [subSetDivSubSetFkSubSetDiv] ON [cep].[subSetorDivisoesSubSetores]([subSetDivID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.subSetorDivisoesSubSetores') AND name='subSetDivSubSetFkSubSetDiv')
    PRINT '<<< CREATED INDEX cep.subSetorDivisoesSubSetores.subSetDivSubSetFkSubSetDiv >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.subSetorDivisoesSubSetores.subSetDivSubSetFkSubSetDiv >>>'
go

