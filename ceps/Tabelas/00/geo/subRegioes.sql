IF OBJECT_ID('[geo].[subRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[subRegioes]
    PRINT '<<< DROPPED TABLE [geo].[subRegioes] >>>'
END
go
/* 
 * TABLE: [geo].[subRegioes] 
 */

CREATE TABLE [geo].[subRegioes](
    [subRegID]  int            IDENTITY(1,1),
    [nome]      varchar(64)    NOT NULL
)
go



IF OBJECT_ID('geo.subRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE geo.subRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE geo.subRegioes >>>'
go

/* 
 * TABLE: [geo].[subRegioes] 
 */

ALTER TABLE [geo].[subRegioes] ADD 
    CONSTRAINT [subRegIxPk] PRIMARY KEY CLUSTERED ([subRegID])
go

IF OBJECT_ID('geo.subRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE geo.subRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE geo.subRegioes >>>'
go

/* 
 * INDEX: [subRegIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.subRegioes') AND name='subRegIxAk')
BEGIN
    DROP INDEX [geo].[subRegioes].[subRegIxAk]
    PRINT '<<< DROPPED INDEX [geo].[subRegioes].[subRegIxAk] >>>'
END
go

/* 
 * INDEX: [subRegIxAk] 
 */

CREATE UNIQUE INDEX [subRegIxAk] ON [geo].[subRegioes]([nome])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.subRegioes') AND name='subRegIxAk')
    PRINT '<<< CREATED INDEX geo.subRegioes.subRegIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.subRegioes.subRegIxAk >>>'
go

