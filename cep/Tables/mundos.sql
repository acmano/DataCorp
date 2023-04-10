IF OBJECT_ID('[mundos]') IS NOT NULL
BEGIN
    DROP TABLE [mundos]
    PRINT '<<< DROPPED TABLE [mundos] >>>'
END
go
/* 
 * TABLE: [mundos] 
 */

CREATE TABLE [mundos](
    [munID]  int            IDENTITY(1,1),
    [nome]   varchar(64)    NOT NULL
)
go



IF OBJECT_ID('mundos') IS NOT NULL
    PRINT '<<< CREATED TABLE mundos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE mundos >>>'
go

/* 
 * TABLE: [mundos] 
 */

ALTER TABLE [mundos] ADD 
    CONSTRAINT [munIxPk] PRIMARY KEY CLUSTERED ([munID])
go

IF OBJECT_ID('mundos') IS NOT NULL
    PRINT '<<< CREATED TABLE mundos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE mundos >>>'
go

/* 
 * INDEX: [munIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('mundos') AND name='munIxAk')
BEGIN
    DROP INDEX [mundos].[munIxAk]
    PRINT '<<< DROPPED INDEX [mundos].[munIxAk] >>>'
END
go

/* 
 * INDEX: [munIxAk] 
 */

CREATE UNIQUE INDEX [munIxAk] ON [mundos]([nome])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('mundos') AND name='munIxAk')
    PRINT '<<< CREATED INDEX mundos.munIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX mundos.munIxAk >>>'
go

