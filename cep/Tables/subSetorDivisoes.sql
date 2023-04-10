IF OBJECT_ID('[subSetorDivisoes]') IS NOT NULL
BEGIN
    DROP TABLE [subSetorDivisoes]
    PRINT '<<< DROPPED TABLE [subSetorDivisoes] >>>'
END
go
/* 
 * TABLE: [subSetorDivisoes] 
 */

CREATE TABLE [subSetorDivisoes](
    [subSetDivID]  int            IDENTITY(1,1),
    [codigo]       char(5)        NOT NULL,
    [nome]         varchar(64)    NOT NULL
)
go



IF OBJECT_ID('subSetorDivisoes') IS NOT NULL
    PRINT '<<< CREATED TABLE subSetorDivisoes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE subSetorDivisoes >>>'
go

/* 
 * TABLE: [subSetorDivisoes] 
 */

ALTER TABLE [subSetorDivisoes] ADD 
    CONSTRAINT [subSetDivIxPk] PRIMARY KEY CLUSTERED ([subSetDivID])
go

IF OBJECT_ID('subSetorDivisoes') IS NOT NULL
    PRINT '<<< CREATED TABLE subSetorDivisoes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE subSetorDivisoes >>>'
go

/* 
 * INDEX: [subSetDivIxFk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subSetorDivisoes') AND name='subSetDivIxFk')
BEGIN
    DROP INDEX [subSetorDivisoes].[subSetDivIxFk]
    PRINT '<<< DROPPED INDEX [subSetorDivisoes].[subSetDivIxFk] >>>'
END
go

/* 
 * INDEX: [subSetDivIxFk] 
 */

CREATE UNIQUE INDEX [subSetDivIxFk] ON [subSetorDivisoes]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subSetorDivisoes') AND name='subSetDivIxFk')
    PRINT '<<< CREATED INDEX subSetorDivisoes.subSetDivIxFk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX subSetorDivisoes.subSetDivIxFk >>>'
go

