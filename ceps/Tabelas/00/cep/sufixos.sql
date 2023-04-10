IF OBJECT_ID('[cep].[sufixos]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[sufixos]
    PRINT '<<< DROPPED TABLE [cep].[sufixos] >>>'
END
go
/* 
 * TABLE: [cep].[sufixos] 
 */

CREATE TABLE [cep].[sufixos](
    [sufID]   int            IDENTITY(1,1),
    [codigo]  char(3)        NOT NULL,
    [nome]    varchar(64)    NOT NULL
)
go



IF OBJECT_ID('cep.sufixos') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.sufixos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.sufixos >>>'
go

/* 
 * TABLE: [cep].[sufixos] 
 */

ALTER TABLE [cep].[sufixos] ADD 
    CONSTRAINT [sufIxPk] PRIMARY KEY CLUSTERED ([sufID])
go

IF OBJECT_ID('cep.sufixos') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.sufixos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.sufixos >>>'
go

/* 
 * INDEX: [sufIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.sufixos') AND name='sufIxAk')
BEGIN
    DROP INDEX [cep].[sufixos].[sufIxAk]
    PRINT '<<< DROPPED INDEX [cep].[sufixos].[sufIxAk] >>>'
END
go

/* 
 * INDEX: [sufIxAk] 
 */

CREATE UNIQUE INDEX [sufIxAk] ON [cep].[sufixos]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.sufixos') AND name='sufIxAk')
    PRINT '<<< CREATED INDEX cep.sufixos.sufIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.sufixos.sufIxAk >>>'
go

