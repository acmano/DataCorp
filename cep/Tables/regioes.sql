IF OBJECT_ID('[regioes]') IS NOT NULL
BEGIN
    DROP TABLE [regioes]
    PRINT '<<< DROPPED TABLE [regioes] >>>'
END
go
IF OBJECT_ID('[regioes]') IS NOT NULL
BEGIN
    DROP TABLE [regioes]
    PRINT '<<< DROPPED TABLE [regioes] >>>'
END
go
/* 
 * TABLE: [regioes] 
 */

CREATE TABLE [regioes](
    [regID]  int            IDENTITY(1,1),
    [nome]   varchar(64)    NOT NULL
)
go



IF OBJECT_ID('regioes') IS NOT NULL
    PRINT '<<< CREATED TABLE regioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE regioes >>>'
go

/* 
 * TABLE: [regioes] 
 */

ALTER TABLE [regioes] ADD 
    CONSTRAINT [regIxPk] PRIMARY KEY CLUSTERED ([regID])
go

IF OBJECT_ID('regioes') IS NOT NULL
    PRINT '<<< CREATED TABLE regioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE regioes >>>'
go

/* 
 * TABLE: [regioes] 
 */

CREATE TABLE [regioes](
    [regID]      int            IDENTITY(1,1),
    [codigo]     char(2)        NOT NULL,
    [nome]       varchar(64)    NOT NULL,
    [cobertura]  varchar(64)    NOT NULL
)
go



IF OBJECT_ID('regioes') IS NOT NULL
    PRINT '<<< CREATED TABLE regioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE regioes >>>'
go

/* 
 * TABLE: [regioes] 
 */

ALTER TABLE [regioes] ADD 
    CONSTRAINT [regIxPk] PRIMARY KEY CLUSTERED ([regID])
go

IF OBJECT_ID('regioes') IS NOT NULL
    PRINT '<<< CREATED TABLE regioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE regioes >>>'
go

/* 
 * INDEX: [regIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioes') AND name='regIxAk')
BEGIN
    DROP INDEX [regioes].[regIxAk]
    PRINT '<<< DROPPED INDEX [regioes].[regIxAk] >>>'
END
go

/* 
 * INDEX: [regIxAk] 
 */

CREATE UNIQUE INDEX [regIxAk] ON [regioes]([nome])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioes') AND name='regIxAk')
    PRINT '<<< CREATED INDEX regioes.regIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX regioes.regIxAk >>>'
go

/* 
 * INDEX: [regIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioes') AND name='regIxAk')
BEGIN
    DROP INDEX [regioes].[regIxAk]
    PRINT '<<< DROPPED INDEX [regioes].[regIxAk] >>>'
END
go

/* 
 * INDEX: [regIxAk] 
 */

CREATE UNIQUE INDEX [regIxAk] ON [regioes]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('regioes') AND name='regIxAk')
    PRINT '<<< CREATED INDEX regioes.regIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX regioes.regIxAk >>>'
go

