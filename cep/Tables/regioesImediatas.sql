IF OBJECT_ID('[regioesImediatas]') IS NOT NULL
BEGIN
    DROP TABLE [regioesImediatas]
    PRINT '<<< DROPPED TABLE [regioesImediatas] >>>'
END
go
/* 
 * TABLE: [regioesImediatas] 
 */

CREATE TABLE [regioesImediatas](
    [regImeID]  int               IDENTITY(1,1),
    [codigo]    char(6)           NOT NULL,
    [nome]      varchar(64)       NOT NULL,
    [area]      decimal(10, 3)    NOT NULL
)
go



IF OBJECT_ID('regioesImediatas') IS NOT NULL
    PRINT '<<< CREATED TABLE regioesImediatas >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE regioesImediatas >>>'
go

/* 
 * TABLE: [regioesImediatas] 
 */

ALTER TABLE [regioesImediatas] ADD 
    CONSTRAINT [regImeIxPk] PRIMARY KEY CLUSTERED ([regImeID])
go

IF OBJECT_ID('regioesImediatas') IS NOT NULL
    PRINT '<<< CREATED TABLE regioesImediatas >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE regioesImediatas >>>'
go

/* 
 * INDEX: [regImeIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesImediatas') AND name='regImeIxAk')
BEGIN
    DROP INDEX [regioesImediatas].[regImeIxAk]
    PRINT '<<< DROPPED INDEX [regioesImediatas].[regImeIxAk] >>>'
END
go

/* 
 * INDEX: [regImeIxAk] 
 */

CREATE UNIQUE INDEX [regImeIxAk] ON [regioesImediatas]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesImediatas') AND name='regImeIxAk')
    PRINT '<<< CREATED INDEX regioesImediatas.regImeIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX regioesImediatas.regImeIxAk >>>'
go

