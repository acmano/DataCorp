IF OBJECT_ID('[cep].[enderecosTiposEnderecos]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[enderecosTiposEnderecos]
    PRINT '<<< DROPPED TABLE [cep].[enderecosTiposEnderecos] >>>'
END
go
/* 
 * TABLE: [cep].[enderecosTiposEnderecos] 
 */

CREATE TABLE [cep].[enderecosTiposEnderecos](
    [endTipEndID]  int    IDENTITY(1,1),
    [endTipID]     int    NOT NULL,
    [endID]        int    NOT NULL
)
go



IF OBJECT_ID('cep.enderecosTiposEnderecos') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.enderecosTiposEnderecos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.enderecosTiposEnderecos >>>'
go

/* 
 * TABLE: [cep].[enderecosTiposEnderecos] 
 */

ALTER TABLE [cep].[enderecosTiposEnderecos] ADD 
    CONSTRAINT [endTipEndIxPk] PRIMARY KEY CLUSTERED ([endTipEndID])
go

IF OBJECT_ID('cep.enderecosTiposEnderecos') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.enderecosTiposEnderecos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.enderecosTiposEnderecos >>>'
go

/* 
 * INDEX: [endTipEndIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.enderecosTiposEnderecos') AND name='endTipEndIxAk')
BEGIN
    DROP INDEX [cep].[enderecosTiposEnderecos].[endTipEndIxAk]
    PRINT '<<< DROPPED INDEX [cep].[enderecosTiposEnderecos].[endTipEndIxAk] >>>'
END
go

/* 
 * INDEX: [endTipEndIxFkEndTip] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.enderecosTiposEnderecos') AND name='endTipEndIxFkEndTip')
BEGIN
    DROP INDEX [cep].[enderecosTiposEnderecos].[endTipEndIxFkEndTip]
    PRINT '<<< DROPPED INDEX [cep].[enderecosTiposEnderecos].[endTipEndIxFkEndTip] >>>'
END
go

/* 
 * INDEX: [endTipEndIxFkEnd] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.enderecosTiposEnderecos') AND name='endTipEndIxFkEnd')
BEGIN
    DROP INDEX [cep].[enderecosTiposEnderecos].[endTipEndIxFkEnd]
    PRINT '<<< DROPPED INDEX [cep].[enderecosTiposEnderecos].[endTipEndIxFkEnd] >>>'
END
go

/* 
 * INDEX: [endTipEndFkEndTip] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.enderecosTiposEnderecos') AND name='endTipEndFkEndTip')
BEGIN
    DROP INDEX [cep].[enderecosTiposEnderecos].[endTipEndFkEndTip]
    PRINT '<<< DROPPED INDEX [cep].[enderecosTiposEnderecos].[endTipEndFkEndTip] >>>'
END
go

/* 
 * INDEX: [endFkEndTipEnd] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.enderecosTiposEnderecos') AND name='endFkEndTipEnd')
BEGIN
    DROP INDEX [cep].[enderecosTiposEnderecos].[endFkEndTipEnd]
    PRINT '<<< DROPPED INDEX [cep].[enderecosTiposEnderecos].[endFkEndTipEnd] >>>'
END
go

/* 
 * INDEX: [endTipEndIxAk] 
 */

CREATE UNIQUE INDEX [endTipEndIxAk] ON [cep].[enderecosTiposEnderecos]([endTipID], [endID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.enderecosTiposEnderecos') AND name='endTipEndIxAk')
    PRINT '<<< CREATED INDEX cep.enderecosTiposEnderecos.endTipEndIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.enderecosTiposEnderecos.endTipEndIxAk >>>'
go

/* 
 * INDEX: [endTipEndIxFkEndTip] 
 */

CREATE INDEX [endTipEndIxFkEndTip] ON [cep].[enderecosTiposEnderecos]([endTipID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.enderecosTiposEnderecos') AND name='endTipEndIxFkEndTip')
    PRINT '<<< CREATED INDEX cep.enderecosTiposEnderecos.endTipEndIxFkEndTip >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.enderecosTiposEnderecos.endTipEndIxFkEndTip >>>'
go

/* 
 * INDEX: [endTipEndIxFkEnd] 
 */

CREATE INDEX [endTipEndIxFkEnd] ON [cep].[enderecosTiposEnderecos]([endID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.enderecosTiposEnderecos') AND name='endTipEndIxFkEnd')
    PRINT '<<< CREATED INDEX cep.enderecosTiposEnderecos.endTipEndIxFkEnd >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.enderecosTiposEnderecos.endTipEndIxFkEnd >>>'
go

/* 
 * INDEX: [endTipEndFkEndTip] 
 */

CREATE INDEX [endTipEndFkEndTip] ON [cep].[enderecosTiposEnderecos]([endTipID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.enderecosTiposEnderecos') AND name='endTipEndFkEndTip')
    PRINT '<<< CREATED INDEX cep.enderecosTiposEnderecos.endTipEndFkEndTip >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.enderecosTiposEnderecos.endTipEndFkEndTip >>>'
go

/* 
 * INDEX: [endFkEndTipEnd] 
 */

CREATE INDEX [endFkEndTipEnd] ON [cep].[enderecosTiposEnderecos]([endID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.enderecosTiposEnderecos') AND name='endFkEndTipEnd')
    PRINT '<<< CREATED INDEX cep.enderecosTiposEnderecos.endFkEndTipEnd >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.enderecosTiposEnderecos.endFkEndTipEnd >>>'
go

