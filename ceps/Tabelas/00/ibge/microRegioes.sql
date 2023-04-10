IF OBJECT_ID('[ibge].[microRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[microRegioes]
    PRINT '<<< DROPPED TABLE [ibge].[microRegioes] >>>'
END
go
/* 
 * TABLE: [ibge].[microRegioes] 
 */

CREATE TABLE [ibge].[microRegioes](
    [micRegID]  int               IDENTITY(1,1),
    [codigo]    char(3)           NOT NULL,
    [nome]      varchar(64)       NOT NULL,
    [area]      decimal(10, 3)    NOT NULL
)
go



IF OBJECT_ID('ibge.microRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.microRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.microRegioes >>>'
go

/* 
 * TABLE: [ibge].[microRegioes] 
 */

ALTER TABLE [ibge].[microRegioes] ADD 
    CONSTRAINT [micRegIxPk] PRIMARY KEY CLUSTERED ([micRegID])
go

IF OBJECT_ID('ibge.microRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.microRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.microRegioes >>>'
go

/* 
 * INDEX: [micRegIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.microRegioes') AND name='micRegIxAk')
BEGIN
    DROP INDEX [ibge].[microRegioes].[micRegIxAk]
    PRINT '<<< DROPPED INDEX [ibge].[microRegioes].[micRegIxAk] >>>'
END
go

/* 
 * INDEX: [micRegIxAk] 
 */

CREATE UNIQUE INDEX [micRegIxAk] ON [ibge].[microRegioes]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.microRegioes') AND name='micRegIxAk')
    PRINT '<<< CREATED INDEX ibge.microRegioes.micRegIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.microRegioes.micRegIxAk >>>'
go

