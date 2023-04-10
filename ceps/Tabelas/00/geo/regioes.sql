IF OBJECT_ID('[geo].[regioes]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[regioes]
    PRINT '<<< DROPPED TABLE [geo].[regioes] >>>'
END
go
/* 
 * TABLE: [geo].[regioes] 
 */

CREATE TABLE [geo].[regioes](
    [regID]  int            IDENTITY(1,1),
    [nome]   varchar(64)    NOT NULL
)
go



IF OBJECT_ID('geo.regioes') IS NOT NULL
    PRINT '<<< CREATED TABLE geo.regioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE geo.regioes >>>'
go

/* 
 * TABLE: [geo].[regioes] 
 */

ALTER TABLE [geo].[regioes] ADD 
    CONSTRAINT [regIxPk] PRIMARY KEY CLUSTERED ([regID])
go

IF OBJECT_ID('geo.regioes') IS NOT NULL
    PRINT '<<< CREATED TABLE geo.regioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE geo.regioes >>>'
go

/* 
 * INDEX: [regIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.regioes') AND name='regIxAk')
BEGIN
    DROP INDEX [geo].[regioes].[regIxAk]
    PRINT '<<< DROPPED INDEX [geo].[regioes].[regIxAk] >>>'
END
go

/* 
 * INDEX: [regIxAk] 
 */

CREATE UNIQUE INDEX [regIxAk] ON [geo].[regioes]([nome])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.regioes') AND name='regIxAk')
    PRINT '<<< CREATED INDEX geo.regioes.regIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.regioes.regIxAk >>>'
go

