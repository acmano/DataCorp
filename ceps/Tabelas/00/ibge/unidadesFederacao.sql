IF OBJECT_ID('[ibge].[unidadesFederacao]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[unidadesFederacao]
    PRINT '<<< DROPPED TABLE [ibge].[unidadesFederacao] >>>'
END
go
/* 
 * TABLE: [ibge].[unidadesFederacao] 
 */

CREATE TABLE [ibge].[unidadesFederacao](
    [uniFedID]  int               IDENTITY(1,1),
    [codigo]    char(2)           NOT NULL,
    [sigla]     char(2)           NOT NULL,
    [nome]      varchar(64)       NOT NULL,
    [area]      decimal(10, 3)    NOT NULL
)
go



IF OBJECT_ID('ibge.unidadesFederacao') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.unidadesFederacao >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.unidadesFederacao >>>'
go

/* 
 * TABLE: [ibge].[unidadesFederacao] 
 */

ALTER TABLE [ibge].[unidadesFederacao] ADD 
    CONSTRAINT [uniFedIxPk] PRIMARY KEY CLUSTERED ([uniFedID])
go

IF OBJECT_ID('ibge.unidadesFederacao') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.unidadesFederacao >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.unidadesFederacao >>>'
go

/* 
 * INDEX: [uniFedIxAk0] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.unidadesFederacao') AND name='uniFedIxAk0')
BEGIN
    DROP INDEX [ibge].[unidadesFederacao].[uniFedIxAk0]
    PRINT '<<< DROPPED INDEX [ibge].[unidadesFederacao].[uniFedIxAk0] >>>'
END
go

/* 
 * INDEX: [uniFedIxAk1] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.unidadesFederacao') AND name='uniFedIxAk1')
BEGIN
    DROP INDEX [ibge].[unidadesFederacao].[uniFedIxAk1]
    PRINT '<<< DROPPED INDEX [ibge].[unidadesFederacao].[uniFedIxAk1] >>>'
END
go

/* 
 * INDEX: [uniFedIxAk0] 
 */

CREATE UNIQUE INDEX [uniFedIxAk0] ON [ibge].[unidadesFederacao]([sigla])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.unidadesFederacao') AND name='uniFedIxAk0')
    PRINT '<<< CREATED INDEX ibge.unidadesFederacao.uniFedIxAk0 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.unidadesFederacao.uniFedIxAk0 >>>'
go

/* 
 * INDEX: [uniFedIxAk1] 
 */

CREATE UNIQUE INDEX [uniFedIxAk1] ON [ibge].[unidadesFederacao]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.unidadesFederacao') AND name='uniFedIxAk1')
    PRINT '<<< CREATED INDEX ibge.unidadesFederacao.uniFedIxAk1 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.unidadesFederacao.uniFedIxAk1 >>>'
go

