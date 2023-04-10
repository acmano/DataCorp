IF OBJECT_ID('[ti].basBanFkBas') IS NOT NULL
  ALTER TABLE [ti].[basesBancos]
    DROP CONSTRAINT basBanFkBas
go

IF OBJECT_ID('[ti].objBasFkBas') IS NOT NULL
  ALTER TABLE [ti].[objetosBases]
    DROP CONSTRAINT objBasFkBas
go

IF OBJECT_ID('[ti].[bases]') IS NOT NULL
BEGIN
  DROP TABLE [ti].[bases]
  PRINT '<<< DROPPED TABLE [ti].[bases] >>>'
END
go


CREATE TABLE [ti].[bases]
(
  [basId]
    bigint
    IDENTITY(1,1)
    CONSTRAINT [basesBasIdNn] NOT NULL
, [nome]
    varchar(64)
    CONSTRAINT [basesNomeNn] NOT NULL
, [descricao]
    varchar(128)
    CONSTRAINT [basesDescricaoNn] NOT NULL
)
go

IF OBJECT_ID('ti.bases') IS NOT NULL
  PRINT '<<< CREATED TABLE ti.bases >>>'
ELSE
  PRINT '<<< FAILED CREATING TABLE ti.bases >>>'
go


ALTER TABLE [ti].[bases]
  ADD CONSTRAINT [basPk]
    PRIMARY KEY CLUSTERED ([basId])
go

IF OBJECT_ID('ti.bases') IS NOT NULL
  PRINT '<<< CREATED TABLE ti.bases >>>'
ELSE
  PRINT '<<< FAILED CREATING TABLE ti.bases >>>'
go


IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.bases') AND name='basIxAk')
BEGIN
  DROP INDEX [ti].[bases].[basIxAk]
  PRINT '<<< DROPPED INDEX [ti].[bases].[basIxAk] >>>'
END
go

CREATE UNIQUE INDEX [basIxAk] ON [ti].[bases]([nome])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.bases') AND name='basIxAk')
  PRINT '<<< CREATED INDEX ti.bases.basIxAk >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.bases.basIxAk >>>'
go

