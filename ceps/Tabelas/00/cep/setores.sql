IF OBJECT_ID('[cep].[setores]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[setores]
    PRINT '<<< DROPPED TABLE [cep].[setores] >>>'
END
go
/* 
 * TABLE: [cep].[setores] 
 */

CREATE TABLE [cep].[setores](
    [setID]   int            IDENTITY(1,1),
    [codigo]  char(3)        NOT NULL,
    [nome]    varchar(64)    NOT NULL
)
go



IF OBJECT_ID('cep.setores') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.setores >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.setores >>>'
go

/* 
 * TABLE: [cep].[setores] 
 */

ALTER TABLE [cep].[setores] ADD 
    CONSTRAINT [setIxPk] PRIMARY KEY CLUSTERED ([setID])
go

IF OBJECT_ID('cep.setores') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.setores >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.setores >>>'
go

/* 
 * INDEX: [setIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.setores') AND name='setIxAk')
BEGIN
    DROP INDEX [cep].[setores].[setIxAk]
    PRINT '<<< DROPPED INDEX [cep].[setores].[setIxAk] >>>'
END
go

/* 
 * INDEX: [setIxAk] 
 */

CREATE UNIQUE INDEX [setIxAk] ON [cep].[setores]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.setores') AND name='setIxAk')
    PRINT '<<< CREATED INDEX cep.setores.setIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.setores.setIxAk >>>'
go

