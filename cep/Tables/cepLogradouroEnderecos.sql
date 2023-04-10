IF OBJECT_ID('[cepLogradouroEnderecos]') IS NOT NULL
BEGIN
    DROP TABLE [cepLogradouroEnderecos]
    PRINT '<<< DROPPED TABLE [cepLogradouroEnderecos] >>>'
END
go
/* 
 * TABLE: [cepLogradouroEnderecos] 
 */

CREATE TABLE [cepLogradouroEnderecos](
    [cepEndID]  int    IDENTITY(1,1),
    [endID]     int    NOT NULL,
    [cepLogID]  int    NOT NULL
)
go



IF OBJECT_ID('cepLogradouroEnderecos') IS NOT NULL
    PRINT '<<< CREATED TABLE cepLogradouroEnderecos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cepLogradouroEnderecos >>>'
go

/* 
 * TABLE: [cepLogradouroEnderecos] 
 */

ALTER TABLE [cepLogradouroEnderecos] ADD 
    CONSTRAINT [cepEndIxPk] PRIMARY KEY CLUSTERED ([cepEndID])
go

IF OBJECT_ID('cepLogradouroEnderecos') IS NOT NULL
    PRINT '<<< CREATED TABLE cepLogradouroEnderecos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cepLogradouroEnderecos >>>'
go

/* 
 * INDEX: [cepEndIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepLogradouroEnderecos') AND name='cepEndIxAk')
BEGIN
    DROP INDEX [cepLogradouroEnderecos].[cepEndIxAk]
    PRINT '<<< DROPPED INDEX [cepLogradouroEnderecos].[cepEndIxAk] >>>'
END
go

/* 
 * INDEX: [cepEndIxFkEnd] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepLogradouroEnderecos') AND name='cepEndIxFkEnd')
BEGIN
    DROP INDEX [cepLogradouroEnderecos].[cepEndIxFkEnd]
    PRINT '<<< DROPPED INDEX [cepLogradouroEnderecos].[cepEndIxFkEnd] >>>'
END
go

/* 
 * INDEX: [cepEndIxFkCepLog] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepLogradouroEnderecos') AND name='cepEndIxFkCepLog')
BEGIN
    DROP INDEX [cepLogradouroEnderecos].[cepEndIxFkCepLog]
    PRINT '<<< DROPPED INDEX [cepLogradouroEnderecos].[cepEndIxFkCepLog] >>>'
END
go

/* 
 * INDEX: [endFkCepEnd] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepLogradouroEnderecos') AND name='endFkCepEnd')
BEGIN
    DROP INDEX [cepLogradouroEnderecos].[endFkCepEnd]
    PRINT '<<< DROPPED INDEX [cepLogradouroEnderecos].[endFkCepEnd] >>>'
END
go

/* 
 * INDEX: [cepLogEndFkCepLog] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepLogradouroEnderecos') AND name='cepLogEndFkCepLog')
BEGIN
    DROP INDEX [cepLogradouroEnderecos].[cepLogEndFkCepLog]
    PRINT '<<< DROPPED INDEX [cepLogradouroEnderecos].[cepLogEndFkCepLog] >>>'
END
go

/* 
 * INDEX: [cepEndIxAk] 
 */

CREATE UNIQUE INDEX [cepEndIxAk] ON [cepLogradouroEnderecos]([endID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepLogradouroEnderecos') AND name='cepEndIxAk')
    PRINT '<<< CREATED INDEX cepLogradouroEnderecos.cepEndIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cepLogradouroEnderecos.cepEndIxAk >>>'
go

/* 
 * INDEX: [cepEndIxFkEnd] 
 */

CREATE INDEX [cepEndIxFkEnd] ON [cepLogradouroEnderecos]([endID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepLogradouroEnderecos') AND name='cepEndIxFkEnd')
    PRINT '<<< CREATED INDEX cepLogradouroEnderecos.cepEndIxFkEnd >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cepLogradouroEnderecos.cepEndIxFkEnd >>>'
go

/* 
 * INDEX: [cepEndIxFkCepLog] 
 */

CREATE INDEX [cepEndIxFkCepLog] ON [cepLogradouroEnderecos]([cepLogID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepLogradouroEnderecos') AND name='cepEndIxFkCepLog')
    PRINT '<<< CREATED INDEX cepLogradouroEnderecos.cepEndIxFkCepLog >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cepLogradouroEnderecos.cepEndIxFkCepLog >>>'
go

/* 
 * INDEX: [endFkCepEnd] 
 */

CREATE INDEX [endFkCepEnd] ON [cepLogradouroEnderecos]([endID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepLogradouroEnderecos') AND name='endFkCepEnd')
    PRINT '<<< CREATED INDEX cepLogradouroEnderecos.endFkCepEnd >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cepLogradouroEnderecos.endFkCepEnd >>>'
go

/* 
 * INDEX: [cepLogEndFkCepLog] 
 */

CREATE INDEX [cepLogEndFkCepLog] ON [cepLogradouroEnderecos]([cepLogID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepLogradouroEnderecos') AND name='cepLogEndFkCepLog')
    PRINT '<<< CREATED INDEX cepLogradouroEnderecos.cepLogEndFkCepLog >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cepLogradouroEnderecos.cepLogEndFkCepLog >>>'
go

