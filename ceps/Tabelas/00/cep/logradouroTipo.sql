IF OBJECT_ID('[cep].[logradouroTipo]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[logradouroTipo]
    PRINT '<<< DROPPED TABLE [cep].[logradouroTipo] >>>'
END
go
/* 
 * TABLE: [cep].[logradouroTipo] 
 */

CREATE TABLE [cep].[logradouroTipo](
    [logTipID]            int             IDENTITY(1,1),
    [nome]                varchar(64)     NOT NULL,
    [descricao]           varchar(256)    NULL,
    [descricaoAbreviada]  char(20)        NOT NULL
)
go



IF OBJECT_ID('cep.logradouroTipo') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.logradouroTipo >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.logradouroTipo >>>'
go

/* 
 * TABLE: [cep].[logradouroTipo] 
 */

ALTER TABLE [cep].[logradouroTipo] ADD 
    CONSTRAINT [logTipIxPk] PRIMARY KEY CLUSTERED ([logTipID])
go

IF OBJECT_ID('cep.logradouroTipo') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.logradouroTipo >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.logradouroTipo >>>'
go

/* 
 * INDEX: [logTipIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.logradouroTipo') AND name='logTipIxAk')
BEGIN
    DROP INDEX [cep].[logradouroTipo].[logTipIxAk]
    PRINT '<<< DROPPED INDEX [cep].[logradouroTipo].[logTipIxAk] >>>'
END
go

/* 
 * INDEX: [logTipIxAk] 
 */

CREATE UNIQUE INDEX [logTipIxAk] ON [cep].[logradouroTipo]([nome])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.logradouroTipo') AND name='logTipIxAk')
    PRINT '<<< CREATED INDEX cep.logradouroTipo.logTipIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.logradouroTipo.logTipIxAk >>>'
go

