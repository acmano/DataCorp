IF OBJECT_ID('[sufixos]') IS NOT NULL
BEGIN
    DROP TABLE [sufixos]
    PRINT '<<< DROPPED TABLE [sufixos] >>>'
END
go
/* 
 * TABLE: [sufixos] 
 */

CREATE TABLE [sufixos](
    [sufID]   int            IDENTITY(1,1),
    [codigo]  char(3)        NOT NULL,
    [nome]    varchar(64)    NOT NULL
)
go



IF OBJECT_ID('sufixos') IS NOT NULL
    PRINT '<<< CREATED TABLE sufixos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE sufixos >>>'
go

/* 
 * TABLE: [sufixos] 
 */

ALTER TABLE [sufixos] ADD 
    CONSTRAINT [sufIxPk] PRIMARY KEY CLUSTERED ([sufID])
go

IF OBJECT_ID('sufixos') IS NOT NULL
    PRINT '<<< CREATED TABLE sufixos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE sufixos >>>'
go

/* 
 * INDEX: [sufIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('sufixos') AND name='sufIxAk')
BEGIN
    DROP INDEX [sufixos].[sufIxAk]
    PRINT '<<< DROPPED INDEX [sufixos].[sufIxAk] >>>'
END
go

/* 
 * INDEX: [sufIxAk] 
 */

CREATE UNIQUE INDEX [sufIxAk] ON [sufixos]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('sufixos') AND name='sufIxAk')
    PRINT '<<< CREATED INDEX sufixos.sufIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX sufixos.sufIxAk >>>'
go

