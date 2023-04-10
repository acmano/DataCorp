IF OBJECT_ID('[ibge].[municipios]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[municipios]
    PRINT '<<< DROPPED TABLE [ibge].[municipios] >>>'
END
go
/* 
 * TABLE: [ibge].[municipios] 
 */

CREATE TABLE [ibge].[municipios](
    [munID]   int               IDENTITY(1,1),
    [codigo]  char(7)           NOT NULL,
    [nome]    varchar(64)       NOT NULL,
    [area]    decimal(10, 3)    NOT NULL
)
go



IF OBJECT_ID('ibge.municipios') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.municipios >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.municipios >>>'
go

/* 
 * TABLE: [ibge].[municipios] 
 */

ALTER TABLE [ibge].[municipios] ADD 
    CONSTRAINT [munIxPk] PRIMARY KEY CLUSTERED ([munID])
go

IF OBJECT_ID('ibge.municipios') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.municipios >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.municipios >>>'
go

/* 
 * INDEX: [munIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.municipios') AND name='munIxAk')
BEGIN
    DROP INDEX [ibge].[municipios].[munIxAk]
    PRINT '<<< DROPPED INDEX [ibge].[municipios].[munIxAk] >>>'
END
go

/* 
 * INDEX: [munIxAk] 
 */

CREATE UNIQUE INDEX [munIxAk] ON [ibge].[municipios]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.municipios') AND name='munIxAk')
    PRINT '<<< CREATED INDEX ibge.municipios.munIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.municipios.munIxAk >>>'
go

