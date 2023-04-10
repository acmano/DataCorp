IF OBJECT_ID('[geo].[paises]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[paises]
    PRINT '<<< DROPPED TABLE [geo].[paises] >>>'
END
go
/* 
 * TABLE: [geo].[paises] 
 */

CREATE TABLE [geo].[paises](
    [paiID]  int            IDENTITY(1,1),
    [nome]   varchar(64)    NOT NULL
)
go



IF OBJECT_ID('geo.paises') IS NOT NULL
    PRINT '<<< CREATED TABLE geo.paises >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE geo.paises >>>'
go

/* 
 * TABLE: [geo].[paises] 
 */

ALTER TABLE [geo].[paises] ADD 
    CONSTRAINT [paiIxPk] PRIMARY KEY CLUSTERED ([paiID])
go

IF OBJECT_ID('geo.paises') IS NOT NULL
    PRINT '<<< CREATED TABLE geo.paises >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE geo.paises >>>'
go

/* 
 * INDEX: [paiIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paises') AND name='paiIxAk')
BEGIN
    DROP INDEX [geo].[paises].[paiIxAk]
    PRINT '<<< DROPPED INDEX [geo].[paises].[paiIxAk] >>>'
END
go

/* 
 * INDEX: [paiIxAk] 
 */

CREATE UNIQUE INDEX [paiIxAk] ON [geo].[paises]([nome])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.paises') AND name='paiIxAk')
    PRINT '<<< CREATED INDEX geo.paises.paiIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.paises.paiIxAk >>>'
go

