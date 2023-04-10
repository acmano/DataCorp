IF OBJECT_ID('[logradouroTipo]') IS NOT NULL
BEGIN
    DROP TABLE [logradouroTipo]
    PRINT '<<< DROPPED TABLE [logradouroTipo] >>>'
END
go
/* 
 * TABLE: [logradouroTipo] 
 */

CREATE TABLE [logradouroTipo](
    [logTipID]            int             IDENTITY(1,1),
    [nome]                varchar(64)     NOT NULL,
    [descricao]           varchar(256)    NULL,
    [descricaoAbreviada]  char(20)        NOT NULL
)
go



IF OBJECT_ID('logradouroTipo') IS NOT NULL
    PRINT '<<< CREATED TABLE logradouroTipo >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE logradouroTipo >>>'
go

/* 
 * TABLE: [logradouroTipo] 
 */

ALTER TABLE [logradouroTipo] ADD 
    CONSTRAINT [logTipIxPk] PRIMARY KEY CLUSTERED ([logTipID])
go

IF OBJECT_ID('logradouroTipo') IS NOT NULL
    PRINT '<<< CREATED TABLE logradouroTipo >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE logradouroTipo >>>'
go

/* 
 * INDEX: [logTipIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('logradouroTipo') AND name='logTipIxAk')
BEGIN
    DROP INDEX [logradouroTipo].[logTipIxAk]
    PRINT '<<< DROPPED INDEX [logradouroTipo].[logTipIxAk] >>>'
END
go

/* 
 * INDEX: [logTipIxAk] 
 */

CREATE UNIQUE INDEX [logTipIxAk] ON [logradouroTipo]([nome])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('logradouroTipo') AND name='logTipIxAk')
    PRINT '<<< CREATED INDEX logradouroTipo.logTipIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX logradouroTipo.logTipIxAk >>>'
go

