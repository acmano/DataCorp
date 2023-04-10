IF OBJECT_ID('[cep].[subSetorDivisoes]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[subSetorDivisoes]
    PRINT '<<< DROPPED TABLE [cep].[subSetorDivisoes] >>>'
END
go
/* 
 * TABLE: [cep].[subSetorDivisoes] 
 */

CREATE TABLE [cep].[subSetorDivisoes](
    [subSetDivID]  int            IDENTITY(1,1),
    [codigo]       char(5)        NOT NULL,
    [nome]         varchar(64)    NOT NULL
)
go



IF OBJECT_ID('cep.subSetorDivisoes') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.subSetorDivisoes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.subSetorDivisoes >>>'
go

/* 
 * TABLE: [cep].[subSetorDivisoes] 
 */

ALTER TABLE [cep].[subSetorDivisoes] ADD 
    CONSTRAINT [subSetDivIxPk] PRIMARY KEY CLUSTERED ([subSetDivID])
go

IF OBJECT_ID('cep.subSetorDivisoes') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.subSetorDivisoes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.subSetorDivisoes >>>'
go

/* 
 * INDEX: [subSetDivIxFk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.subSetorDivisoes') AND name='subSetDivIxFk')
BEGIN
    DROP INDEX [cep].[subSetorDivisoes].[subSetDivIxFk]
    PRINT '<<< DROPPED INDEX [cep].[subSetorDivisoes].[subSetDivIxFk] >>>'
END
go

/* 
 * INDEX: [subSetDivIxFk] 
 */

CREATE UNIQUE INDEX [subSetDivIxFk] ON [cep].[subSetorDivisoes]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.subSetorDivisoes') AND name='subSetDivIxFk')
    PRINT '<<< CREATED INDEX cep.subSetorDivisoes.subSetDivIxFk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.subSetorDivisoes.subSetDivIxFk >>>'
go

