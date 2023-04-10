IF OBJECT_ID('[ibge].[regiao]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[regiao]
    PRINT '<<< DROPPED TABLE [ibge].[regiao] >>>'
END
go
/* 
 * TABLE: [ibge].[regiao] 
 */

CREATE TABLE [ibge].[regiao](
    [regID]   int               IDENTITY(1,1),
    [codigo]  char(2)           NOT NULL,
    [nome]    varchar(64)       NOT NULL,
    [sigla]   char(2)           NOT NULL,
    [area]    decimal(10, 3)    NOT NULL
)
go



IF OBJECT_ID('ibge.regiao') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.regiao >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.regiao >>>'
go

/* 
 * TABLE: [ibge].[regiao] 
 */

ALTER TABLE [ibge].[regiao] ADD 
    CONSTRAINT [regIxPk] PRIMARY KEY CLUSTERED ([regID])
go

IF OBJECT_ID('ibge.regiao') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.regiao >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.regiao >>>'
go

/* 
 * INDEX: [regIxAk0] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regiao') AND name='regIxAk0')
BEGIN
    DROP INDEX [ibge].[regiao].[regIxAk0]
    PRINT '<<< DROPPED INDEX [ibge].[regiao].[regIxAk0] >>>'
END
go

/* 
 * INDEX: [regIxAk1] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regiao') AND name='regIxAk1')
BEGIN
    DROP INDEX [ibge].[regiao].[regIxAk1]
    PRINT '<<< DROPPED INDEX [ibge].[regiao].[regIxAk1] >>>'
END
go

/* 
 * INDEX: [regIxAk0] 
 */

CREATE UNIQUE INDEX [regIxAk0] ON [ibge].[regiao]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regiao') AND name='regIxAk0')
    PRINT '<<< CREATED INDEX ibge.regiao.regIxAk0 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.regiao.regIxAk0 >>>'
go

/* 
 * INDEX: [regIxAk1] 
 */

CREATE UNIQUE INDEX [regIxAk1] ON [ibge].[regiao]([sigla])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.regiao') AND name='regIxAk1')
    PRINT '<<< CREATED INDEX ibge.regiao.regIxAk1 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.regiao.regIxAk1 >>>'
go

