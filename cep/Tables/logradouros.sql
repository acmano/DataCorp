IF OBJECT_ID('[logradouros]') IS NOT NULL
BEGIN
    DROP TABLE [logradouros]
    PRINT '<<< DROPPED TABLE [logradouros] >>>'
END
go
/* 
 * TABLE: [logradouros] 
 */

CREATE TABLE [logradouros](
    [logID]         int            IDENTITY(1,1),
    [nome]          varchar(64)    NOT NULL,
    [nomeReduzido]  varchar(20)    NOT NULL
)
go



IF OBJECT_ID('logradouros') IS NOT NULL
    PRINT '<<< CREATED TABLE logradouros >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE logradouros >>>'
go

/* 
 * TABLE: [logradouros] 
 */

ALTER TABLE [logradouros] ADD 
    CONSTRAINT [logIxPk] PRIMARY KEY CLUSTERED ([logID])
go

IF OBJECT_ID('logradouros') IS NOT NULL
    PRINT '<<< CREATED TABLE logradouros >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE logradouros >>>'
go

/* 
 * INDEX: [logIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('logradouros') AND name='logIxAk')
BEGIN
    DROP INDEX [logradouros].[logIxAk]
    PRINT '<<< DROPPED INDEX [logradouros].[logIxAk] >>>'
END
go

/* 
 * INDEX: [logIxAk] 
 */

CREATE UNIQUE INDEX [logIxAk] ON [logradouros]([nome])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('logradouros') AND name='logIxAk')
    PRINT '<<< CREATED INDEX logradouros.logIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX logradouros.logIxAk >>>'
go

