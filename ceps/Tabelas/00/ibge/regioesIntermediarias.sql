IF OBJECT_ID('[ibge].[regioesIntermediarias]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[regioesIntermediarias]
    PRINT '<<< DROPPED TABLE [ibge].[regioesIntermediarias] >>>'
END
go
/* 
 * TABLE: [ibge].[regioesIntermediarias] 
 */

CREATE TABLE [ibge].[regioesIntermediarias](
    [regIntID]  int               IDENTITY(1,1),
    [codigo]    char(4)           NOT NULL,
    [nome]      varchar(64)       NOT NULL,
    [area]      decimal(10, 3)    NOT NULL
)
go



IF OBJECT_ID('ibge.regioesIntermediarias') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.regioesIntermediarias >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.regioesIntermediarias >>>'
go

/* 
 * TABLE: [ibge].[regioesIntermediarias] 
 */

ALTER TABLE [ibge].[regioesIntermediarias] ADD 
    CONSTRAINT [regIntIxPk] PRIMARY KEY CLUSTERED ([regIntID])
go

IF OBJECT_ID('ibge.regioesIntermediarias') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.regioesIntermediarias >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.regioesIntermediarias >>>'
go

/* 
 * INDEX: [regIntIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesIntermediarias') AND name='regIntIxAk')
BEGIN
    DROP INDEX [ibge].[regioesIntermediarias].[regIntIxAk]
    PRINT '<<< DROPPED INDEX [ibge].[regioesIntermediarias].[regIntIxAk] >>>'
END
go

/* 
 * INDEX: [regIntIxAk] 
 */

CREATE UNIQUE INDEX [regIntIxAk] ON [ibge].[regioesIntermediarias]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regioesIntermediarias') AND name='regIntIxAk')
    PRINT '<<< CREATED INDEX ibge.regioesIntermediarias.regIntIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.regioesIntermediarias.regIntIxAk >>>'
go

