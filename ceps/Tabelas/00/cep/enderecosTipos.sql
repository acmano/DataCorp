IF OBJECT_ID('[cep].[enderecosTipos]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[enderecosTipos]
    PRINT '<<< DROPPED TABLE [cep].[enderecosTipos] >>>'
END
go
/* 
 * TABLE: [cep].[enderecosTipos] 
 */

CREATE TABLE [cep].[enderecosTipos](
    [endTipID]  int            IDENTITY(1,1),
    [codigo]    varchar(15)    NOT NULL,
    [nome]      varchar(64)    NOT NULL
)
go



IF OBJECT_ID('cep.enderecosTipos') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.enderecosTipos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.enderecosTipos >>>'
go

/* 
 * TABLE: [cep].[enderecosTipos] 
 */

ALTER TABLE [cep].[enderecosTipos] ADD 
    CONSTRAINT [endTipIxPk] PRIMARY KEY CLUSTERED ([endTipID])
go

IF OBJECT_ID('cep.enderecosTipos') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.enderecosTipos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.enderecosTipos >>>'
go

/* 
 * INDEX: [endTipIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.enderecosTipos') AND name='endTipIxAk')
BEGIN
    DROP INDEX [cep].[enderecosTipos].[endTipIxAk]
    PRINT '<<< DROPPED INDEX [cep].[enderecosTipos].[endTipIxAk] >>>'
END
go

/* 
 * INDEX: [endTipIxAk] 
 */

CREATE UNIQUE INDEX [endTipIxAk] ON [cep].[enderecosTipos]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.enderecosTipos') AND name='endTipIxAk')
    PRINT '<<< CREATED INDEX cep.enderecosTipos.endTipIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.enderecosTipos.endTipIxAk >>>'
go

