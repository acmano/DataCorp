IF OBJECT_ID('[cep].[regioes]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[regioes]
    PRINT '<<< DROPPED TABLE [cep].[regioes] >>>'
END
go
/* 
 * TABLE: [cep].[regioes] 
 */

CREATE TABLE [cep].[regioes](
    [regID]      int            IDENTITY(1,1),
    [codigo]     char(2)        NOT NULL,
    [nome]       varchar(64)    NOT NULL,
    [cobertura]  varchar(64)    NOT NULL
)
go



IF OBJECT_ID('cep.regioes') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.regioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.regioes >>>'
go

/* 
 * TABLE: [cep].[regioes] 
 */

ALTER TABLE [cep].[regioes] ADD 
    CONSTRAINT [regIxPk] PRIMARY KEY CLUSTERED ([regID])
go

IF OBJECT_ID('cep.regioes') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.regioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.regioes >>>'
go

/* 
 * INDEX: [regIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.regioes') AND name='regIxAk')
BEGIN
    DROP INDEX [cep].[regioes].[regIxAk]
    PRINT '<<< DROPPED INDEX [cep].[regioes].[regIxAk] >>>'
END
go

/* 
 * INDEX: [regIxAk] 
 */

CREATE UNIQUE INDEX [regIxAk] ON [cep].[regioes]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.regioes') AND name='regIxAk')
    PRINT '<<< CREATED INDEX cep.regioes.regIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.regioes.regIxAk >>>'
go

