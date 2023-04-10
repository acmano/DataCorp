IF OBJECT_ID('[microRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [microRegioes]
    PRINT '<<< DROPPED TABLE [microRegioes] >>>'
END
go
/* 
 * TABLE: [microRegioes] 
 */

CREATE TABLE [microRegioes](
    [micRegID]  int               IDENTITY(1,1),
    [codigo]    char(3)           NOT NULL,
    [nome]      varchar(64)       NOT NULL,
    [area]      decimal(10, 3)    NOT NULL
)
go



IF OBJECT_ID('microRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE microRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE microRegioes >>>'
go

/* 
 * TABLE: [microRegioes] 
 */

ALTER TABLE [microRegioes] ADD 
    CONSTRAINT [micRegIxPk] PRIMARY KEY CLUSTERED ([micRegID])
go

IF OBJECT_ID('microRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE microRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE microRegioes >>>'
go

/* 
 * INDEX: [micRegIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('microRegioes') AND name='micRegIxAk')
BEGIN
    DROP INDEX [microRegioes].[micRegIxAk]
    PRINT '<<< DROPPED INDEX [microRegioes].[micRegIxAk] >>>'
END
go

/* 
 * INDEX: [micRegIxAk] 
 */

CREATE UNIQUE INDEX [micRegIxAk] ON [microRegioes]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('microRegioes') AND name='micRegIxAk')
    PRINT '<<< CREATED INDEX microRegioes.micRegIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX microRegioes.micRegIxAk >>>'
go

