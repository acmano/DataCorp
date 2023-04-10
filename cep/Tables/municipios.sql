IF OBJECT_ID('[municipios]') IS NOT NULL
BEGIN
    DROP TABLE [municipios]
    PRINT '<<< DROPPED TABLE [municipios] >>>'
END
go
/* 
 * TABLE: [municipios] 
 */

CREATE TABLE [municipios](
    [munID]   int               IDENTITY(1,1),
    [codigo]  char(7)           NOT NULL,
    [nome]    varchar(64)       NOT NULL,
    [area]    decimal(10, 3)    NOT NULL
)
go



IF OBJECT_ID('municipios') IS NOT NULL
    PRINT '<<< CREATED TABLE municipios >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE municipios >>>'
go

/* 
 * TABLE: [municipios] 
 */

ALTER TABLE [municipios] ADD 
    CONSTRAINT [munIxPk] PRIMARY KEY CLUSTERED ([munID])
go

IF OBJECT_ID('municipios') IS NOT NULL
    PRINT '<<< CREATED TABLE municipios >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE municipios >>>'
go

/* 
 * INDEX: [munIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('municipios') AND name='munIxAk')
BEGIN
    DROP INDEX [municipios].[munIxAk]
    PRINT '<<< DROPPED INDEX [municipios].[munIxAk] >>>'
END
go

/* 
 * INDEX: [munIxAk] 
 */

CREATE UNIQUE INDEX [munIxAk] ON [municipios]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('municipios') AND name='munIxAk')
    PRINT '<<< CREATED INDEX municipios.munIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX municipios.munIxAk >>>'
go

