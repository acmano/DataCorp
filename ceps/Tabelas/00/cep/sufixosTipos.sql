IF OBJECT_ID('[cep].[sufixosTipos]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[sufixosTipos]
    PRINT '<<< DROPPED TABLE [cep].[sufixosTipos] >>>'
END
go
/* 
 * TABLE: [cep].[sufixosTipos] 
 */

CREATE TABLE [cep].[sufixosTipos](
    [sufTipID]  int            IDENTITY(1,1),
    [codigo]    char(2)        NOT NULL,
    [nome]      varchar(64)    NOT NULL
)
go



IF OBJECT_ID('cep.sufixosTipos') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.sufixosTipos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.sufixosTipos >>>'
go

/* 
 * TABLE: [cep].[sufixosTipos] 
 */

ALTER TABLE [cep].[sufixosTipos] ADD 
    CONSTRAINT [sufTipIxPk] PRIMARY KEY CLUSTERED ([sufTipID])
go

IF OBJECT_ID('cep.sufixosTipos') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.sufixosTipos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.sufixosTipos >>>'
go

/* 
 * INDEX: [sufTipIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.sufixosTipos') AND name='sufTipIxAk')
BEGIN
    DROP INDEX [cep].[sufixosTipos].[sufTipIxAk]
    PRINT '<<< DROPPED INDEX [cep].[sufixosTipos].[sufTipIxAk] >>>'
END
go

/* 
 * INDEX: [sufTipIxAk] 
 */

CREATE UNIQUE INDEX [sufTipIxAk] ON [cep].[sufixosTipos]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.sufixosTipos') AND name='sufTipIxAk')
    PRINT '<<< CREATED INDEX cep.sufixosTipos.sufTipIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.sufixosTipos.sufTipIxAk >>>'
go

