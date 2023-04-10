IF OBJECT_ID('[regioesIntermediarias]') IS NOT NULL
BEGIN
    DROP TABLE [regioesIntermediarias]
    PRINT '<<< DROPPED TABLE [regioesIntermediarias] >>>'
END
go
/* 
 * TABLE: [regioesIntermediarias] 
 */

CREATE TABLE [regioesIntermediarias](
    [regIntID]  int               IDENTITY(1,1),
    [codigo]    char(4)           NOT NULL,
    [nome]      varchar(64)       NOT NULL,
    [area]      decimal(10, 3)    NOT NULL
)
go



IF OBJECT_ID('regioesIntermediarias') IS NOT NULL
    PRINT '<<< CREATED TABLE regioesIntermediarias >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE regioesIntermediarias >>>'
go

/* 
 * TABLE: [regioesIntermediarias] 
 */

ALTER TABLE [regioesIntermediarias] ADD 
    CONSTRAINT [regIntIxPk] PRIMARY KEY CLUSTERED ([regIntID])
go

IF OBJECT_ID('regioesIntermediarias') IS NOT NULL
    PRINT '<<< CREATED TABLE regioesIntermediarias >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE regioesIntermediarias >>>'
go

/* 
 * INDEX: [regIntIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesIntermediarias') AND name='regIntIxAk')
BEGIN
    DROP INDEX [regioesIntermediarias].[regIntIxAk]
    PRINT '<<< DROPPED INDEX [regioesIntermediarias].[regIntIxAk] >>>'
END
go

/* 
 * INDEX: [regIntIxAk] 
 */

CREATE UNIQUE INDEX [regIntIxAk] ON [regioesIntermediarias]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioesIntermediarias') AND name='regIntIxAk')
    PRINT '<<< CREATED INDEX regioesIntermediarias.regIntIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX regioesIntermediarias.regIntIxAk >>>'
go

