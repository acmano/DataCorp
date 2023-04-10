IF OBJECT_ID('[geo].[continentes]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[continentes]
    PRINT '<<< DROPPED TABLE [geo].[continentes] >>>'
END
go
/* 
 * TABLE: [geo].[continentes] 
 */

CREATE TABLE [geo].[continentes](
    [ctnID]  int            IDENTITY(1,1),
    [nome]   varchar(64)    NOT NULL
)
go



IF OBJECT_ID('geo.continentes') IS NOT NULL
    PRINT '<<< CREATED TABLE geo.continentes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE geo.continentes >>>'
go

/* 
 * TABLE: [geo].[continentes] 
 */

ALTER TABLE [geo].[continentes] ADD 
    CONSTRAINT [ctnIxPk] PRIMARY KEY CLUSTERED ([ctnID])
go

IF OBJECT_ID('geo.continentes') IS NOT NULL
    PRINT '<<< CREATED TABLE geo.continentes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE geo.continentes >>>'
go

/* 
 * INDEX: [ctnIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.continentes') AND name='ctnIxAk')
BEGIN
    DROP INDEX [geo].[continentes].[ctnIxAk]
    PRINT '<<< DROPPED INDEX [geo].[continentes].[ctnIxAk] >>>'
END
go

/* 
 * INDEX: [ctnIxAk] 
 */

CREATE UNIQUE INDEX [ctnIxAk] ON [geo].[continentes]([nome])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.continentes') AND name='ctnIxAk')
    PRINT '<<< CREATED INDEX geo.continentes.ctnIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.continentes.ctnIxAk >>>'
go

