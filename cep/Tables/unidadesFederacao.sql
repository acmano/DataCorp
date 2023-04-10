IF OBJECT_ID('[unidadesFederacao]') IS NOT NULL
BEGIN
    DROP TABLE [unidadesFederacao]
    PRINT '<<< DROPPED TABLE [unidadesFederacao] >>>'
END
go
/* 
 * TABLE: [unidadesFederacao] 
 */

CREATE TABLE [unidadesFederacao](
    [uniFedID]  int               IDENTITY(1,1),
    [codigo]    char(2)           NOT NULL,
    [sigla]     char(2)           NOT NULL,
    [nome]      varchar(64)       NOT NULL,
    [area]      decimal(10, 3)    NOT NULL
)
go



IF OBJECT_ID('unidadesFederacao') IS NOT NULL
    PRINT '<<< CREATED TABLE unidadesFederacao >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE unidadesFederacao >>>'
go

/* 
 * TABLE: [unidadesFederacao] 
 */

ALTER TABLE [unidadesFederacao] ADD 
    CONSTRAINT [uniFedIxPk] PRIMARY KEY CLUSTERED ([uniFedID])
go

IF OBJECT_ID('unidadesFederacao') IS NOT NULL
    PRINT '<<< CREATED TABLE unidadesFederacao >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE unidadesFederacao >>>'
go

/* 
 * INDEX: [uniFedIxAk0] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('unidadesFederacao') AND name='uniFedIxAk0')
BEGIN
    DROP INDEX [unidadesFederacao].[uniFedIxAk0]
    PRINT '<<< DROPPED INDEX [unidadesFederacao].[uniFedIxAk0] >>>'
END
go

/* 
 * INDEX: [uniFedIxAk1] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('unidadesFederacao') AND name='uniFedIxAk1')
BEGIN
    DROP INDEX [unidadesFederacao].[uniFedIxAk1]
    PRINT '<<< DROPPED INDEX [unidadesFederacao].[uniFedIxAk1] >>>'
END
go

/* 
 * INDEX: [uniFedIxAk0] 
 */

CREATE UNIQUE INDEX [uniFedIxAk0] ON [unidadesFederacao]([sigla])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('unidadesFederacao') AND name='uniFedIxAk0')
    PRINT '<<< CREATED INDEX unidadesFederacao.uniFedIxAk0 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX unidadesFederacao.uniFedIxAk0 >>>'
go

/* 
 * INDEX: [uniFedIxAk1] 
 */

CREATE UNIQUE INDEX [uniFedIxAk1] ON [unidadesFederacao]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('unidadesFederacao') AND name='uniFedIxAk1')
    PRINT '<<< CREATED INDEX unidadesFederacao.uniFedIxAk1 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX unidadesFederacao.uniFedIxAk1 >>>'
go

