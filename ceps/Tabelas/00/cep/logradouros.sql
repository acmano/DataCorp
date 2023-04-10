IF OBJECT_ID('[cep].[logradouros]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[logradouros]
    PRINT '<<< DROPPED TABLE [cep].[logradouros] >>>'
END
go
/* 
 * TABLE: [cep].[logradouros] 
 */

CREATE TABLE [cep].[logradouros](
    [logID]         int            IDENTITY(1,1),
    [nome]          varchar(64)    NOT NULL,
    [nomeReduzido]  varchar(20)    NOT NULL
)
go



IF OBJECT_ID('cep.logradouros') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.logradouros >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.logradouros >>>'
go

/* 
 * TABLE: [cep].[logradouros] 
 */

ALTER TABLE [cep].[logradouros] ADD 
    CONSTRAINT [logIxPk] PRIMARY KEY CLUSTERED ([logID])
go

IF OBJECT_ID('cep.logradouros') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.logradouros >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.logradouros >>>'
go

/* 
 * INDEX: [logIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.logradouros') AND name='logIxAk')
BEGIN
    DROP INDEX [cep].[logradouros].[logIxAk]
    PRINT '<<< DROPPED INDEX [cep].[logradouros].[logIxAk] >>>'
END
go

/* 
 * INDEX: [logIxAk] 
 */

CREATE UNIQUE INDEX [logIxAk] ON [cep].[logradouros]([nome])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.logradouros') AND name='logIxAk')
    PRINT '<<< CREATED INDEX cep.logradouros.logIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.logradouros.logIxAk >>>'
go

