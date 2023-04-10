IF OBJECT_ID('[ibge].[regioesImediatas]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[regioesImediatas]
    PRINT '<<< DROPPED TABLE [ibge].[regioesImediatas] >>>'
END
go
/* 
 * TABLE: [ibge].[regioesImediatas] 
 */

CREATE TABLE [ibge].[regioesImediatas](
    [regImeID]  int               IDENTITY(1,1),
    [codigo]    char(6)           NOT NULL,
    [nome]      varchar(64)       NOT NULL,
    [area]      decimal(10, 3)    NOT NULL
)
go



IF OBJECT_ID('ibge.regioesImediatas') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.regioesImediatas >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.regioesImediatas >>>'
go

/* 
 * TABLE: [ibge].[regioesImediatas] 
 */

ALTER TABLE [ibge].[regioesImediatas] ADD 
    CONSTRAINT [regImeIxPk] PRIMARY KEY CLUSTERED ([regImeID])
go

IF OBJECT_ID('ibge.regioesImediatas') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.regioesImediatas >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.regioesImediatas >>>'
go

/* 
 * INDEX: [regImeIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesImediatas') AND name='regImeIxAk')
BEGIN
    DROP INDEX [ibge].[regioesImediatas].[regImeIxAk]
    PRINT '<<< DROPPED INDEX [ibge].[regioesImediatas].[regImeIxAk] >>>'
END
go

/* 
 * INDEX: [regImeIxAk] 
 */

CREATE UNIQUE INDEX [regImeIxAk] ON [ibge].[regioesImediatas]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesImediatas') AND name='regImeIxAk')
    PRINT '<<< CREATED INDEX ibge.regioesImediatas.regImeIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.regioesImediatas.regImeIxAk >>>'
go

