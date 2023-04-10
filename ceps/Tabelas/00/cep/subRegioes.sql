IF OBJECT_ID('[cep].[subRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[subRegioes]
    PRINT '<<< DROPPED TABLE [cep].[subRegioes] >>>'
END
go
/* 
 * TABLE: [cep].[subRegioes] 
 */

CREATE TABLE [cep].[subRegioes](
    [subRegID]  int            IDENTITY(1,1),
    [codigo]    char(2)        NOT NULL,
    [nome]      varchar(64)    NOT NULL
)
go



IF OBJECT_ID('cep.subRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.subRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.subRegioes >>>'
go

/* 
 * TABLE: [cep].[subRegioes] 
 */

ALTER TABLE [cep].[subRegioes] ADD 
    CONSTRAINT [subRegIxPk] PRIMARY KEY CLUSTERED ([subRegID])
go

IF OBJECT_ID('cep.subRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.subRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.subRegioes >>>'
go

/* 
 * INDEX: [subRegIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.subRegioes') AND name='subRegIxAk')
BEGIN
    DROP INDEX [cep].[subRegioes].[subRegIxAk]
    PRINT '<<< DROPPED INDEX [cep].[subRegioes].[subRegIxAk] >>>'
END
go

/* 
 * INDEX: [subRegIxAk] 
 */

CREATE UNIQUE INDEX [subRegIxAk] ON [cep].[subRegioes]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.subRegioes') AND name='subRegIxAk')
    PRINT '<<< CREATED INDEX cep.subRegioes.subRegIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.subRegioes.subRegIxAk >>>'
go

