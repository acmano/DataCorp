IF OBJECT_ID('[nacoes]') IS NOT NULL
BEGIN
    DROP TABLE [nacoes]
    PRINT '<<< DROPPED TABLE [nacoes] >>>'
END
go
/* 
 * TABLE: [nacoes] 
 */

CREATE TABLE [nacoes](
    [nacID]      int                 IDENTITY(1,1),
    [m49]        int                 NOT NULL,
    [isoAlpha2]  char(2)             NULL,
    [isoAlpha3]  char(3)             NULL,
    [latitude]   double precision    NULL,
    [longitude]  double precision    NULL
)
go



IF OBJECT_ID('nacoes') IS NOT NULL
    PRINT '<<< CREATED TABLE nacoes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE nacoes >>>'
go

/* 
 * TABLE: [nacoes] 
 */

ALTER TABLE [nacoes] ADD 
    CONSTRAINT [nacIxPk] PRIMARY KEY CLUSTERED ([nacID])
go

IF OBJECT_ID('nacoes') IS NOT NULL
    PRINT '<<< CREATED TABLE nacoes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE nacoes >>>'
go

/* 
 * INDEX: [nacIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoes') AND name='nacIxAk')
BEGIN
    DROP INDEX [nacoes].[nacIxAk]
    PRINT '<<< DROPPED INDEX [nacoes].[nacIxAk] >>>'
END
go

/* 
 * INDEX: [nacIx00] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoes') AND name='nacIx00')
BEGIN
    DROP INDEX [nacoes].[nacIx00]
    PRINT '<<< DROPPED INDEX [nacoes].[nacIx00] >>>'
END
go

/* 
 * INDEX: [nacIx01] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoes') AND name='nacIx01')
BEGIN
    DROP INDEX [nacoes].[nacIx01]
    PRINT '<<< DROPPED INDEX [nacoes].[nacIx01] >>>'
END
go

/* 
 * INDEX: [nacIxAk] 
 */

CREATE UNIQUE INDEX [nacIxAk] ON [nacoes]([m49])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoes') AND name='nacIxAk')
    PRINT '<<< CREATED INDEX nacoes.nacIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX nacoes.nacIxAk >>>'
go

/* 
 * INDEX: [nacIx00] 
 */

CREATE INDEX [nacIx00] ON [nacoes]([isoAlpha2])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoes') AND name='nacIx00')
    PRINT '<<< CREATED INDEX nacoes.nacIx00 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX nacoes.nacIx00 >>>'
go

/* 
 * INDEX: [nacIx01] 
 */

CREATE INDEX [nacIx01] ON [nacoes]([isoAlpha3])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoes') AND name='nacIx01')
    PRINT '<<< CREATED INDEX nacoes.nacIx01 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX nacoes.nacIx01 >>>'
go

