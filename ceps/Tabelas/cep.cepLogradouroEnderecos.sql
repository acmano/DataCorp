IF OBJECT_ID('[cep].[cepsLogradouroEnderecos]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[cepsLogradouroEnderecos]
    PRINT '<<< DROPPED TABLE [cep].[cepsLogradouroEnderecos] >>>'
END
GO
/* 
 * TABLE: [cep].[cepsLogradouroEnderecos] 
 */

CREATE TABLE [cep].[cepsLogradouroEnderecos]
(
	[cepLogEndID]
		bigInt
		IDENTITY(1,1)
    CONSTRAINT [cepLogEndCepLogEndIdNn] NOT NULL
, [endID]
		bigInt
		NOT NULL
    CONSTRAINT [cepLogEndEndIdNn] NOT NULL
, [cepLogID]
		bigInt
		NOT NULL
    CONSTRAINT [cepLogEndCepLogIdNn] NOT NULL
)
GO



IF OBJECT_ID('cep.cepsLogradouroEnderecos') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.cepsLogradouroEnderecos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.cepsLogradouroEnderecos >>>'
GO

/* 
 * TABLE: [cep].[cepsLogradouroEnderecos] 
 */

ALTER TABLE [cep].[cepsLogradouroEnderecos]
	ADD CONSTRAINT [cepLogEndIxPk]
	PRIMARY KEY CLUSTERED ([cepLogEndID])
GO

IF EXISTS ( SELECT DISTINCT 1 FROM sysobjects WHERE xtype = 'PK' AND parent_obj = OBJECT_ID ('cep.cepsLogradourosEnderecos'))
  PRINT '<<< CREATED PRIMARY KEY cepLogEndIxPk >>>'
ELSE
  PRINT '<<< FAILED CREATING PRIMARY KEY cepLogEndIxPk >>>'
GO


/* 
 * INDEX: [cepLogEndIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsLogradouroEnderecos') AND name='cepLogEndIxAk')
BEGIN
    DROP INDEX [cep].[cepsLogradouroEnderecos].[cepLogEndIxAk]
    PRINT '<<< DROPPED INDEX [cep].[cepsLogradouroEnderecos].[cepLogEndIxAk] >>>'
END
GO

CREATE UNIQUE INDEX [cepLogEndIxAk] ON [cep].[cepsLogradouroEnderecos]([endID, cepLogEndId])
GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsLogradouroEnderecos') AND name='cepLogEndIxAk')
    PRINT '<<< CREATED INDEX cep.cepsLogradouroEnderecos.cepLogEndIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.cepsLogradouroEnderecos.cepLogEndIxAk >>>'
GO


/* 
 * INDEX: [cepLogEndIxFkEnd] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsLogradouroEnderecos') AND name='cepLogEndIxFkEnd')
BEGIN
    DROP INDEX [cep].[cepsLogradouroEnderecos].[cepLogEndIxFkEnd]
    PRINT '<<< DROPPED INDEX [cep].[cepsLogradouroEnderecos].[cepLogEndIxFkEnd] >>>'
END
GO

CREATE INDEX [cepLogEndIxFkEnd] ON [cep].[cepsLogradouroEnderecos]([endID])
GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsLogradouroEnderecos') AND name='cepLogEndIxFkEnd')
    PRINT '<<< CREATED INDEX cep.cepsLogradouroEnderecos.cepLogEndIxFkEnd >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.cepsLogradouroEnderecos.cepLogEndIxFkEnd >>>'
GO


/* 
 * INDEX: [cepLogEndIxFkCepLog] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsLogradouroEnderecos') AND name='cepLogEndIxFkCepLog')
BEGIN
    DROP INDEX [cep].[cepsLogradouroEnderecos].[cepLogEndIxFkCepLog]
    PRINT '<<< DROPPED INDEX [cep].[cepsLogradouroEnderecos].[cepLogEndIxFkCepLog] >>>'
END
GO

CREATE INDEX [cepLogEndIxFkCepLog] ON [cep].[cepsLogradouroEnderecos]([cepLogID])
GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsLogradouroEnderecos') AND name='cepLogEndIxFkCepLog')
    PRINT '<<< CREATED INDEX cep.cepsLogradouroEnderecos.cepLogEndIxFkCepLog >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.cepsLogradouroEnderecos.cepLogEndIxFkCepLog >>>'
GO