IF OBJECT_ID('[enderecosTipos]') IS NOT NULL
BEGIN
    DROP TABLE [enderecosTipos]
    PRINT '<<< DROPPED TABLE [enderecosTipos] >>>'
END
go
/* 
 * TABLE: [enderecosTipos] 
 */

CREATE TABLE [enderecosTipos](
    [endTipID]  int            IDENTITY(1,1),
    [codigo]    varchar(15)    NOT NULL,
    [nome]      varchar(64)    NOT NULL
)
go



IF OBJECT_ID('enderecosTipos') IS NOT NULL
    PRINT '<<< CREATED TABLE enderecosTipos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE enderecosTipos >>>'
go

/* 
 * TABLE: [enderecosTipos] 
 */

ALTER TABLE [enderecosTipos] ADD 
    CONSTRAINT [endTipIxPk] PRIMARY KEY CLUSTERED ([endTipID])
go

IF OBJECT_ID('enderecosTipos') IS NOT NULL
    PRINT '<<< CREATED TABLE enderecosTipos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE enderecosTipos >>>'
go

/* 
 * INDEX: [endTipIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('enderecosTipos') AND name='endTipIxAk')
BEGIN
    DROP INDEX [enderecosTipos].[endTipIxAk]
    PRINT '<<< DROPPED INDEX [enderecosTipos].[endTipIxAk] >>>'
END
go

/* 
 * INDEX: [endTipIxAk] 
 */

CREATE UNIQUE INDEX [endTipIxAk] ON [enderecosTipos]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('enderecosTipos') AND name='endTipIxAk')
    PRINT '<<< CREATED INDEX enderecosTipos.endTipIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX enderecosTipos.endTipIxAk >>>'
go

