IF OBJECT_ID('[regiao]') IS NOT NULL
BEGIN
    DROP TABLE [regiao]
    PRINT '<<< DROPPED TABLE [regiao] >>>'
END
go
/* 
 * TABLE: [regiao] 
 */

CREATE TABLE [regiao](
    [regID]   int               IDENTITY(1,1),
    [codigo]  char(2)           NOT NULL,
    [nome]    varchar(64)       NOT NULL,
    [sigla]   char(2)           NOT NULL,
    [area]    decimal(10, 3)    NOT NULL
)
go



IF OBJECT_ID('regiao') IS NOT NULL
    PRINT '<<< CREATED TABLE regiao >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE regiao >>>'
go

/* 
 * TABLE: [regiao] 
 */

ALTER TABLE [regiao] ADD 
    CONSTRAINT [regIxPk] PRIMARY KEY CLUSTERED ([regID])
go

IF OBJECT_ID('regiao') IS NOT NULL
    PRINT '<<< CREATED TABLE regiao >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE regiao >>>'
go

/* 
 * INDEX: [regIxAk0] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regiao') AND name='regIxAk0')
BEGIN
    DROP INDEX [regiao].[regIxAk0]
    PRINT '<<< DROPPED INDEX [regiao].[regIxAk0] >>>'
END
go

/* 
 * INDEX: [regIxAk1] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regiao') AND name='regIxAk1')
BEGIN
    DROP INDEX [regiao].[regIxAk1]
    PRINT '<<< DROPPED INDEX [regiao].[regIxAk1] >>>'
END
go

/* 
 * INDEX: [regIxAk0] 
 */

CREATE UNIQUE INDEX [regIxAk0] ON [regiao]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regiao') AND name='regIxAk0')
    PRINT '<<< CREATED INDEX regiao.regIxAk0 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX regiao.regIxAk0 >>>'
go

/* 
 * INDEX: [regIxAk1] 
 */

CREATE UNIQUE INDEX [regIxAk1] ON [regiao]([sigla])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regiao') AND name='regIxAk1')
    PRINT '<<< CREATED INDEX regiao.regIxAk1 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX regiao.regIxAk1 >>>'
go

