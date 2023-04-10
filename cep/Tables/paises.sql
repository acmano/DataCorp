IF OBJECT_ID('[paises]') IS NOT NULL
BEGIN
    DROP TABLE [paises]
    PRINT '<<< DROPPED TABLE [paises] >>>'
END
go
/* 
 * TABLE: [paises] 
 */

CREATE TABLE [paises](
    [paiID]  int            IDENTITY(1,1),
    [nome]   varchar(64)    NOT NULL
)
go



IF OBJECT_ID('paises') IS NOT NULL
    PRINT '<<< CREATED TABLE paises >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE paises >>>'
go

/* 
 * TABLE: [paises] 
 */

ALTER TABLE [paises] ADD 
    CONSTRAINT [paiIxPk] PRIMARY KEY CLUSTERED ([paiID])
go

IF OBJECT_ID('paises') IS NOT NULL
    PRINT '<<< CREATED TABLE paises >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE paises >>>'
go

/* 
 * INDEX: [paiIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('paises') AND name='paiIxAk')
BEGIN
    DROP INDEX [paises].[paiIxAk]
    PRINT '<<< DROPPED INDEX [paises].[paiIxAk] >>>'
END
go

/* 
 * INDEX: [paiIxAk] 
 */

CREATE UNIQUE INDEX [paiIxAk] ON [paises]([nome])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('paises') AND name='paiIxAk')
    PRINT '<<< CREATED INDEX paises.paiIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX paises.paiIxAk >>>'
go

