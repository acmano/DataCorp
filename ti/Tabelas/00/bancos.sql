IF OBJECT_ID('[ti].basBanFkBan') IS NOT NULL
  ALTER TABLE [ti].[basesBancos]
    DROP CONSTRAINT [basBanFkBan]
GO

IF OBJECT_ID('[ti].[bancos]') IS NOT NULL
BEGIN
  DROP TABLE [ti].[bancos]
  PRINT '<<< DROPPED TABLE [ti].[bancos] >>>'
END
GO


CREATE TABLE [ti].[bancos]
(
  [banId]
    bigint
    IDENTITY(1,1)
    CONSTRAINT [bancosBanIdNn] NOT NULL
, [nome]
    varchar(64)
    CONSTRAINT [bancosNomeNn] NOT NULL
, [descricao]
    varchar(128)
    CONSTRAINT [bancosDescricaoNn] NOT NULL
)
GO

IF OBJECT_ID('ti.bancos') IS NOT NULL
  PRINT '<<< CREATED TABLE ti.bancos >>>'
ELSE
  PRINT '<<< FAILED CREATING TABLE ti.bancos >>>'
GO


ALTER TABLE [ti].[bancos]
  ADD CONSTRAINT [banPk]
    PRIMARY KEY CLUSTERED ([banId])
GO

IF EXISTS ( SELECT DISTINCT 1 FROM sysobjects WHERE xtype = 'PK' AND parent_obj = OBJECT_ID ('ti.bancos'))
  PRINT '<<< CREATED PRIMARY KEY banPk >>>'
ELSE
  PRINT '<<< FAILED CREATING PRIMARY KEY banPk >>>'
GO


IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.bancos') AND name='banIxAk')
BEGIN
  DROP INDEX [ti].[bancos].[banIxAk]
  PRINT '<<< DROPPED INDEX [ti].[bancos].[banIxAk] >>>'
END
GO

CREATE UNIQUE INDEX [banIxAk] ON [ti].[bancos]([nome])
GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.bancos') AND name='banIxAk')
  PRINT '<<< CREATED INDEX ti.bancos.banIxAk >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.bancos.banIxAk >>>'
GO