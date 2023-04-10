IF OBJECT_ID('[continentes]') IS NOT NULL
BEGIN
    DROP TABLE [continentes]
    PRINT '<<< DROPPED TABLE [continentes] >>>'
END
go
/* 
 * TABLE: [continentes] 
 */

CREATE TABLE [continentes](
    [ctnID]  int            IDENTITY(1,1),
    [nome]   varchar(64)    NOT NULL
)
go



IF OBJECT_ID('continentes') IS NOT NULL
    PRINT '<<< CREATED TABLE continentes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE continentes >>>'
go

/* 
 * TABLE: [continentes] 
 */

ALTER TABLE [continentes] ADD 
    CONSTRAINT [ctnIxPk] PRIMARY KEY CLUSTERED ([ctnID])
go

IF OBJECT_ID('continentes') IS NOT NULL
    PRINT '<<< CREATED TABLE continentes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE continentes >>>'
go

/* 
 * INDEX: [ctnIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('continentes') AND name='ctnIxAk')
BEGIN
    DROP INDEX [continentes].[ctnIxAk]
    PRINT '<<< DROPPED INDEX [continentes].[ctnIxAk] >>>'
END
go

/* 
 * INDEX: [ctnIxAk] 
 */

CREATE UNIQUE INDEX [ctnIxAk] ON [continentes]([nome])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('continentes') AND name='ctnIxAk')
    PRINT '<<< CREATED INDEX continentes.ctnIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX continentes.ctnIxAk >>>'
go

