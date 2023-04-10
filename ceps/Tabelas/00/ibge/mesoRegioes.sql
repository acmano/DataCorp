IF OBJECT_ID('[ibge].[mesoRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[mesoRegioes]
    PRINT '<<< DROPPED TABLE [ibge].[mesoRegioes] >>>'
END
go
/* 
 * TABLE: [ibge].[mesoRegioes] 
 */

CREATE TABLE [ibge].[mesoRegioes](
    [mesRegID]  int               IDENTITY(1,1),
    [codigo]    char(2)           NOT NULL,
    [nome]      varchar(64)       NOT NULL,
    [area]      decimal(10, 3)    NOT NULL
)
go



IF OBJECT_ID('ibge.mesoRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.mesoRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.mesoRegioes >>>'
go

/* 
 * TABLE: [ibge].[mesoRegioes] 
 */

ALTER TABLE [ibge].[mesoRegioes] ADD 
    CONSTRAINT [mesRegIxPk] PRIMARY KEY CLUSTERED ([mesRegID])
go

IF OBJECT_ID('ibge.mesoRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.mesoRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.mesoRegioes >>>'
go

/* 
 * INDEX: [mesRegIxAK] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.mesoRegioes') AND name='mesRegIxAK')
BEGIN
    DROP INDEX [ibge].[mesoRegioes].[mesRegIxAK]
    PRINT '<<< DROPPED INDEX [ibge].[mesoRegioes].[mesRegIxAK] >>>'
END
go

/* 
 * INDEX: [mesRegIxAK] 
 */

CREATE UNIQUE INDEX [mesRegIxAK] ON [ibge].[mesoRegioes]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.mesoRegioes') AND name='mesRegIxAK')
    PRINT '<<< CREATED INDEX ibge.mesoRegioes.mesRegIxAK >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.mesoRegioes.mesRegIxAK >>>'
go

