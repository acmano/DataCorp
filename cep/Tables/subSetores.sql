IF OBJECT_ID('[subSetores]') IS NOT NULL
BEGIN
    DROP TABLE [subSetores]
    PRINT '<<< DROPPED TABLE [subSetores] >>>'
END
go
/* 
 * TABLE: [subSetores] 
 */

CREATE TABLE [subSetores](
    [subSetID]  int            IDENTITY(1,1),
    [codigo]    char(4)        NOT NULL,
    [nome]      varchar(64)    NOT NULL
)
go



IF OBJECT_ID('subSetores') IS NOT NULL
    PRINT '<<< CREATED TABLE subSetores >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE subSetores >>>'
go

/* 
 * TABLE: [subSetores] 
 */

ALTER TABLE [subSetores] ADD 
    CONSTRAINT [subSetIxPk] PRIMARY KEY CLUSTERED ([subSetID])
go

IF OBJECT_ID('subSetores') IS NOT NULL
    PRINT '<<< CREATED TABLE subSetores >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE subSetores >>>'
go

/* 
 * INDEX: [subSetIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subSetores') AND name='subSetIxAk')
BEGIN
    DROP INDEX [subSetores].[subSetIxAk]
    PRINT '<<< DROPPED INDEX [subSetores].[subSetIxAk] >>>'
END
go

/* 
 * INDEX: [subSetIxAk] 
 */

CREATE UNIQUE INDEX [subSetIxAk] ON [subSetores]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subSetores') AND name='subSetIxAk')
    PRINT '<<< CREATED INDEX subSetores.subSetIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX subSetores.subSetIxAk >>>'
go

