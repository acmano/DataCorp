IF OBJECT_ID('[subRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [subRegioes]
    PRINT '<<< DROPPED TABLE [subRegioes] >>>'
END
go
IF OBJECT_ID('[subRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [subRegioes]
    PRINT '<<< DROPPED TABLE [subRegioes] >>>'
END
go
/* 
 * TABLE: [subRegioes] 
 */

CREATE TABLE [subRegioes](
    [subRegID]  int            IDENTITY(1,1),
    [nome]      varchar(64)    NOT NULL
)
go



IF OBJECT_ID('subRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE subRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE subRegioes >>>'
go

/* 
 * TABLE: [subRegioes] 
 */

ALTER TABLE [subRegioes] ADD 
    CONSTRAINT [subRegIxPk] PRIMARY KEY CLUSTERED ([subRegID])
go

IF OBJECT_ID('subRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE subRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE subRegioes >>>'
go

/* 
 * TABLE: [subRegioes] 
 */

CREATE TABLE [subRegioes](
    [subRegID]  int            IDENTITY(1,1),
    [codigo]    char(2)        NOT NULL,
    [nome]      varchar(64)    NOT NULL
)
go



IF OBJECT_ID('subRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE subRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE subRegioes >>>'
go

/* 
 * TABLE: [subRegioes] 
 */

ALTER TABLE [subRegioes] ADD 
    CONSTRAINT [subRegIxPk] PRIMARY KEY CLUSTERED ([subRegID])
go

IF OBJECT_ID('subRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE subRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE subRegioes >>>'
go

/* 
 * INDEX: [subRegIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subRegioes') AND name='subRegIxAk')
BEGIN
    DROP INDEX [subRegioes].[subRegIxAk]
    PRINT '<<< DROPPED INDEX [subRegioes].[subRegIxAk] >>>'
END
go

/* 
 * INDEX: [subRegIxAk] 
 */

CREATE UNIQUE INDEX [subRegIxAk] ON [subRegioes]([nome])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subRegioes') AND name='subRegIxAk')
    PRINT '<<< CREATED INDEX subRegioes.subRegIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX subRegioes.subRegIxAk >>>'
go

/* 
 * INDEX: [subRegIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subRegioes') AND name='subRegIxAk')
BEGIN
    DROP INDEX [subRegioes].[subRegIxAk]
    PRINT '<<< DROPPED INDEX [subRegioes].[subRegIxAk] >>>'
END
go

/* 
 * INDEX: [subRegIxAk] 
 */

CREATE UNIQUE INDEX [subRegIxAk] ON [subRegioes]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subRegioes') AND name='subRegIxAk')
    PRINT '<<< CREATED INDEX subRegioes.subRegIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX subRegioes.subRegIxAk >>>'
go

