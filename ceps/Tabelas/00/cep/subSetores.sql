IF OBJECT_ID('[cep].[subSetores]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[subSetores]
    PRINT '<<< DROPPED TABLE [cep].[subSetores] >>>'
END
go
/* 
 * TABLE: [cep].[subSetores] 
 */

CREATE TABLE [cep].[subSetores](
    [subSetID]  int            IDENTITY(1,1),
    [codigo]    char(4)        NOT NULL,
    [nome]      varchar(64)    NOT NULL
)
go



IF OBJECT_ID('cep.subSetores') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.subSetores >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.subSetores >>>'
go

/* 
 * TABLE: [cep].[subSetores] 
 */

ALTER TABLE [cep].[subSetores] ADD 
    CONSTRAINT [subSetIxPk] PRIMARY KEY CLUSTERED ([subSetID])
go

IF OBJECT_ID('cep.subSetores') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.subSetores >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.subSetores >>>'
go

/* 
 * INDEX: [subSetIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.subSetores') AND name='subSetIxAk')
BEGIN
    DROP INDEX [cep].[subSetores].[subSetIxAk]
    PRINT '<<< DROPPED INDEX [cep].[subSetores].[subSetIxAk] >>>'
END
go

/* 
 * INDEX: [subSetIxAk] 
 */

CREATE UNIQUE INDEX [subSetIxAk] ON [cep].[subSetores]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.subSetores') AND name='subSetIxAk')
    PRINT '<<< CREATED INDEX cep.subSetores.subSetIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.subSetores.subSetIxAk >>>'
go

