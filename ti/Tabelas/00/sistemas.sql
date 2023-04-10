USE DataCorp 
GO

IF OBJECT_ID('[ti].proSisFkSis') IS NOT NULL
  ALTER TABLE [ti].[programasSistemas]
    DROP CONSTRAINT proSisFkSis
go

IF OBJECT_ID('[ti].[sistemas]') IS NOT NULL
BEGIN
  DROP TABLE [ti].[sistemas]
  PRINT '<<< DROPPED TABLE [ti].[sistemas] >>>'
END
go


CREATE TABLE [ti].[sistemas]
(
  [sisId]
    bigint
    IDENTITY(1,1)
    CONSTRAINT [sistemasSisIdNn] NOT NULL
, [nome]
    varchar(64)
    CONSTRAINT [sistemasNomeNn] NOT NULL
, [descricao]
    varchar(256)
    CONSTRAINT [sistemasdDescricao] NOT NULL
)
go

IF OBJECT_ID('ti.sistemas') IS NOT NULL
  PRINT '<<< CREATED TABLE ti.sistemas >>>'
ELSE
  PRINT '<<< FAILED CREATING TABLE ti.sistemas >>>'
go


ALTER TABLE [ti].[sistemas]
  ADD CONSTRAINT [sisPk]
    PRIMARY KEY CLUSTERED ([sisId])
go

IF OBJECT_ID('ti.sistemas') IS NOT NULL
  PRINT '<<< CREATED TABLE ti.sistemas >>>'
ELSE
  PRINT '<<< FAILED CREATING TABLE ti.sistemas >>>'
go


IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.sistemas') AND name='sisIxAk')
BEGIN
  DROP INDEX [ti].[sistemas].[sisIxAk]
  PRINT '<<< DROPPED INDEX [ti].[sistemas].[sisIxAk] >>>'
END
go

CREATE UNIQUE INDEX [sisIxAk] ON [ti].[sistemas]([nome])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.sistemas') AND name='sisIxAk')
  PRINT '<<< CREATED INDEX ti.sistemas.sisIxAk >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.sistemas.sisIxAk >>>'
go

