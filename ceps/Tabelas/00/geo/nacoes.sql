IF OBJECT_ID('[geo].[nacoes]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[nacoes]
    PRINT '<<< DROPPED TABLE [geo].[nacoes] >>>'
END
go
/* 
 * TABLE: [geo].[nacoes] 
 */

CREATE TABLE [geo].[nacoes](
    [nacID]      int                 IDENTITY(1,1),
    [m49]        int                 NOT NULL,
    [isoAlpha2]  char(2)             NULL,
    [isoAlpha3]  char(3)             NULL,
    [latitude]   double precision    NULL,
    [longitude]  double precision    NULL
)
go



IF OBJECT_ID('geo.nacoes') IS NOT NULL
    PRINT '<<< CREATED TABLE geo.nacoes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE geo.nacoes >>>'
go

/* 
 * TABLE: [geo].[nacoes] 
 */

ALTER TABLE [geo].[nacoes] ADD 
    CONSTRAINT [nacIxPk] PRIMARY KEY CLUSTERED ([nacID])
go

IF OBJECT_ID('geo.nacoes') IS NOT NULL
    PRINT '<<< CREATED TABLE geo.nacoes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE geo.nacoes >>>'
go

/* 
 * INDEX: [nacIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoes') AND name='nacIxAk')
BEGIN
    DROP INDEX [geo].[nacoes].[nacIxAk]
    PRINT '<<< DROPPED INDEX [geo].[nacoes].[nacIxAk] >>>'
END
go

/* 
 * INDEX: [nacIx00] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoes') AND name='nacIx00')
BEGIN
    DROP INDEX [geo].[nacoes].[nacIx00]
    PRINT '<<< DROPPED INDEX [geo].[nacoes].[nacIx00] >>>'
END
go

/* 
 * INDEX: [nacIx01] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoes') AND name='nacIx01')
BEGIN
    DROP INDEX [geo].[nacoes].[nacIx01]
    PRINT '<<< DROPPED INDEX [geo].[nacoes].[nacIx01] >>>'
END
go

/* 
 * INDEX: [nacIxAk] 
 */

CREATE UNIQUE INDEX [nacIxAk] ON [geo].[nacoes]([m49])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoes') AND name='nacIxAk')
    PRINT '<<< CREATED INDEX geo.nacoes.nacIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.nacoes.nacIxAk >>>'
go

/* 
 * INDEX: [nacIx00] 
 */

CREATE INDEX [nacIx00] ON [geo].[nacoes]([isoAlpha2])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoes') AND name='nacIx00')
    PRINT '<<< CREATED INDEX geo.nacoes.nacIx00 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.nacoes.nacIx00 >>>'
go

/* 
 * INDEX: [nacIx01] 
 */

CREATE INDEX [nacIx01] ON [geo].[nacoes]([isoAlpha3])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoes') AND name='nacIx01')
    PRINT '<<< CREATED INDEX geo.nacoes.nacIx01 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.nacoes.nacIx01 >>>'
go

