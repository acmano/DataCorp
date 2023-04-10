USE DataCorp 
GO

IF OBJECT_ID('[ti].basBanFkBan') IS NOT NULL
  ALTER TABLE [ti].[basesBancos]
    DROP CONSTRAINT [basBanFkBan]
go

IF OBJECT_ID('[ti].basBanFkBas') IS NOT NULL
  ALTER TABLE [ti].[basesBancos]
    DROP CONSTRAINT [basBanFkBas]
go

IF OBJECT_ID('[ti].[basesBancos]') IS NOT NULL
BEGIN
  DROP TABLE [ti].[basesBancos]
  PRINT '<<< DROPPED TABLE [ti].[basesBancos] >>>'
END
go
/* 
 * TABLE: [ti].[basesBancos] 
 */

CREATE TABLE [ti].[basesBancos](
  [basBanId]
    bigint
    IDENTITY(1,1)
    CONSTRAINT [basesBancosBasBanIdNn] NOT NULL
, [banId]
    bigint
    CONSTRAINT [basesBancosBanIdNn] NOT NULL
, [basId]
    bigint
    CONSTRAINT [basesBancosBasIdNn] NOT NULL
)
go

IF OBJECT_ID('ti.basesBancos') IS NOT NULL
  PRINT '<<< CREATED TABLE ti.basesBancos >>>'
ELSE
  PRINT '<<< FAILED CREATING TABLE ti.basesBancos >>>'
go

ALTER TABLE [ti].[basesBancos]
  ADD CONSTRAINT [basBanIxPk]
  PRIMARY KEY CLUSTERED ([basBanId])
go

IF OBJECT_ID('ti.basesBancos') IS NOT NULL
  PRINT '<<< CREATED TABLE ti.basesBancos >>>'
ELSE
  PRINT '<<< FAILED CREATING TABLE ti.basesBancos >>>'
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.basesBancos') AND name='basBanIxAk')
BEGIN
  DROP INDEX [ti].[basesBancos].[basBanIxAk]
  PRINT '<<< DROPPED INDEX [ti].[basesBancos].[basBanIxAk] >>>'
END
go

CREATE UNIQUE INDEX [basBanIxAk] ON [ti].[basesBancos]([banId], [basId])
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.basesBancos') AND name='basBanIxAk')
  PRINT '<<< CREATED INDEX ti.basesBancos.basBanIxAk >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.basesBancos.basBanIxAk >>>'
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.basesBancos') AND name='basBanIxFkBan')
BEGIN
  DROP INDEX [ti].[basesBancos].[basBanIxFkBan]
  PRINT '<<< DROPPED INDEX [ti].[basesBancos].[basBanIxFkBan] >>>'
END
go

CREATE INDEX [basBanIxFkBan] ON [ti].[basesBancos]([banId])
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.basesBancos') AND name='basBanIxFkBan')
  PRINT '<<< CREATED INDEX ti.basesBancos.basBanIxFkBan >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.basesBancos.basBanIxFkBan >>>'
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.basesBancos') AND name='basBanIxFkBas')
BEGIN
  DROP INDEX [ti].[basesBancos].[basBanIxFkBas]
  PRINT '<<< DROPPED INDEX [ti].[basesBancos].[basBanIxFkBas] >>>'
END
go

CREATE INDEX [basBanIxFkBas] ON [ti].[basesBancos]([basId])
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.basesBancos') AND name='basBanIxFkBas')
  PRINT '<<< CREATED INDEX ti.basesBancos.basBanIxFkBas >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.basesBancos.basBanIxFkBas >>>'
go

ALTER TABLE [ti].[basesBancos]
  ADD CONSTRAINT [basBanFkBan] 
    FOREIGN KEY ([banId])
    REFERENCES [ti].[bancos]([banId])
go

ALTER TABLE [ti].[basesBancos]
  ADD CONSTRAINT [basBanFkBas] 
    FOREIGN KEY ([basId])
    REFERENCES [ti].[bases]([basId])
go


