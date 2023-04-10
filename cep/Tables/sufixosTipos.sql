IF OBJECT_ID('[sufixosTipos]') IS NOT NULL
BEGIN
    DROP TABLE [sufixosTipos]
    PRINT '<<< DROPPED TABLE [sufixosTipos] >>>'
END
go
/* 
 * TABLE: [sufixosTipos] 
 */

CREATE TABLE [sufixosTipos](
    [sufTipID]  int            IDENTITY(1,1),
    [codigo]    char(2)        NOT NULL,
    [nome]      varchar(64)    NOT NULL
)
go



IF OBJECT_ID('sufixosTipos') IS NOT NULL
    PRINT '<<< CREATED TABLE sufixosTipos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE sufixosTipos >>>'
go

/* 
 * TABLE: [sufixosTipos] 
 */

ALTER TABLE [sufixosTipos] ADD 
    CONSTRAINT [sufTipIxPk] PRIMARY KEY CLUSTERED ([sufTipID])
go

IF OBJECT_ID('sufixosTipos') IS NOT NULL
    PRINT '<<< CREATED TABLE sufixosTipos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE sufixosTipos >>>'
go

/* 
 * INDEX: [sufTipIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('sufixosTipos') AND name='sufTipIxAk')
BEGIN
    DROP INDEX [sufixosTipos].[sufTipIxAk]
    PRINT '<<< DROPPED INDEX [sufixosTipos].[sufTipIxAk] >>>'
END
go

/* 
 * INDEX: [sufTipIxAk] 
 */

CREATE UNIQUE INDEX [sufTipIxAk] ON [sufixosTipos]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('sufixosTipos') AND name='sufTipIxAk')
    PRINT '<<< CREATED INDEX sufixosTipos.sufTipIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX sufixosTipos.sufTipIxAk >>>'
go

