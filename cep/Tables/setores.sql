IF OBJECT_ID('[setores]') IS NOT NULL
BEGIN
    DROP TABLE [setores]
    PRINT '<<< DROPPED TABLE [setores] >>>'
END
go
/* 
 * TABLE: [setores] 
 */

CREATE TABLE [setores](
    [setID]   int            IDENTITY(1,1),
    [codigo]  char(3)        NOT NULL,
    [nome]    varchar(64)    NOT NULL
)
go



IF OBJECT_ID('setores') IS NOT NULL
    PRINT '<<< CREATED TABLE setores >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE setores >>>'
go

/* 
 * TABLE: [setores] 
 */

ALTER TABLE [setores] ADD 
    CONSTRAINT [setIxPk] PRIMARY KEY CLUSTERED ([setID])
go

IF OBJECT_ID('setores') IS NOT NULL
    PRINT '<<< CREATED TABLE setores >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE setores >>>'
go

/* 
 * INDEX: [setIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('setores') AND name='setIxAk')
BEGIN
    DROP INDEX [setores].[setIxAk]
    PRINT '<<< DROPPED INDEX [setores].[setIxAk] >>>'
END
go

/* 
 * INDEX: [setIxAk] 
 */

CREATE UNIQUE INDEX [setIxAk] ON [setores]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('setores') AND name='setIxAk')
    PRINT '<<< CREATED INDEX setores.setIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX setores.setIxAk >>>'
go

