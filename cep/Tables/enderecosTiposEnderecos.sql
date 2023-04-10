IF OBJECT_ID('[enderecosTiposEnderecos]') IS NOT NULL
BEGIN
    DROP TABLE [enderecosTiposEnderecos]
    PRINT '<<< DROPPED TABLE [enderecosTiposEnderecos] >>>'
END
go
/* 
 * TABLE: [enderecosTiposEnderecos] 
 */

CREATE TABLE [enderecosTiposEnderecos](
    [endTipEndID]  int    IDENTITY(1,1),
    [endTipID]     int    NOT NULL,
    [endID]        int    NOT NULL
)
go



IF OBJECT_ID('enderecosTiposEnderecos') IS NOT NULL
    PRINT '<<< CREATED TABLE enderecosTiposEnderecos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE enderecosTiposEnderecos >>>'
go

/* 
 * TABLE: [enderecosTiposEnderecos] 
 */

ALTER TABLE [enderecosTiposEnderecos] ADD 
    CONSTRAINT [endTipEndIxPk] PRIMARY KEY CLUSTERED ([endTipEndID])
go

IF OBJECT_ID('enderecosTiposEnderecos') IS NOT NULL
    PRINT '<<< CREATED TABLE enderecosTiposEnderecos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE enderecosTiposEnderecos >>>'
go

/* 
 * INDEX: [endTipEndIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('enderecosTiposEnderecos') AND name='endTipEndIxAk')
BEGIN
    DROP INDEX [enderecosTiposEnderecos].[endTipEndIxAk]
    PRINT '<<< DROPPED INDEX [enderecosTiposEnderecos].[endTipEndIxAk] >>>'
END
go

/* 
 * INDEX: [endTipEndIxFkEndTip] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('enderecosTiposEnderecos') AND name='endTipEndIxFkEndTip')
BEGIN
    DROP INDEX [enderecosTiposEnderecos].[endTipEndIxFkEndTip]
    PRINT '<<< DROPPED INDEX [enderecosTiposEnderecos].[endTipEndIxFkEndTip] >>>'
END
go

/* 
 * INDEX: [endTipEndIxFkEnd] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('enderecosTiposEnderecos') AND name='endTipEndIxFkEnd')
BEGIN
    DROP INDEX [enderecosTiposEnderecos].[endTipEndIxFkEnd]
    PRINT '<<< DROPPED INDEX [enderecosTiposEnderecos].[endTipEndIxFkEnd] >>>'
END
go

/* 
 * INDEX: [endTipEndFkEndTip] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('enderecosTiposEnderecos') AND name='endTipEndFkEndTip')
BEGIN
    DROP INDEX [enderecosTiposEnderecos].[endTipEndFkEndTip]
    PRINT '<<< DROPPED INDEX [enderecosTiposEnderecos].[endTipEndFkEndTip] >>>'
END
go

/* 
 * INDEX: [endFkEndTipEnd] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('enderecosTiposEnderecos') AND name='endFkEndTipEnd')
BEGIN
    DROP INDEX [enderecosTiposEnderecos].[endFkEndTipEnd]
    PRINT '<<< DROPPED INDEX [enderecosTiposEnderecos].[endFkEndTipEnd] >>>'
END
go

/* 
 * INDEX: [endTipEndIxAk] 
 */

CREATE UNIQUE INDEX [endTipEndIxAk] ON [enderecosTiposEnderecos]([endTipID], [endID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('enderecosTiposEnderecos') AND name='endTipEndIxAk')
    PRINT '<<< CREATED INDEX enderecosTiposEnderecos.endTipEndIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX enderecosTiposEnderecos.endTipEndIxAk >>>'
go

/* 
 * INDEX: [endTipEndIxFkEndTip] 
 */

CREATE INDEX [endTipEndIxFkEndTip] ON [enderecosTiposEnderecos]([endTipID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('enderecosTiposEnderecos') AND name='endTipEndIxFkEndTip')
    PRINT '<<< CREATED INDEX enderecosTiposEnderecos.endTipEndIxFkEndTip >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX enderecosTiposEnderecos.endTipEndIxFkEndTip >>>'
go

/* 
 * INDEX: [endTipEndIxFkEnd] 
 */

CREATE INDEX [endTipEndIxFkEnd] ON [enderecosTiposEnderecos]([endID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('enderecosTiposEnderecos') AND name='endTipEndIxFkEnd')
    PRINT '<<< CREATED INDEX enderecosTiposEnderecos.endTipEndIxFkEnd >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX enderecosTiposEnderecos.endTipEndIxFkEnd >>>'
go

/* 
 * INDEX: [endTipEndFkEndTip] 
 */

CREATE INDEX [endTipEndFkEndTip] ON [enderecosTiposEnderecos]([endTipID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('enderecosTiposEnderecos') AND name='endTipEndFkEndTip')
    PRINT '<<< CREATED INDEX enderecosTiposEnderecos.endTipEndFkEndTip >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX enderecosTiposEnderecos.endTipEndFkEndTip >>>'
go

/* 
 * INDEX: [endFkEndTipEnd] 
 */

CREATE INDEX [endFkEndTipEnd] ON [enderecosTiposEnderecos]([endID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('enderecosTiposEnderecos') AND name='endFkEndTipEnd')
    PRINT '<<< CREATED INDEX enderecosTiposEnderecos.endFkEndTipEnd >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX enderecosTiposEnderecos.endFkEndTipEnd >>>'
go

