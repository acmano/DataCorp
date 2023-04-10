USE DataCorp
GO


IF OBJECT_ID('[ti].linProFklin') IS NOT NULL
  ALTER TABLE [ti].[linguagensProgramas]
    DROP CONSTRAINT linProFkLin
go

IF OBJECT_ID('[ti].[linguagens]') IS NOT NULL
BEGIN
  DROP TABLE [ti].[linguagens]
  PRINT '<<< DROPPED TABLE [ti].[linguagens] >>>'
END
go


CREATE TABLE [ti].[linguagens]
(
  [linId]
    bigint
    IDENTITY(1,1)
    CONSTRAINT [linguagensLinIdNn] NOT NULL
, [nome]
    varchar(64)
    CONSTRAINT [linguagensNomeNn] NOT NULL
, [descricao]
    varchar(256)
    CONSTRAINT [linguagensDescricaoNn] NOT NULL
)
go

ALTER TABLE [ti].[linguagens]
  ADD CONSTRAINT [linPk]
    PRIMARY KEY CLUSTERED ([linId])
go

IF OBJECT_ID('ti.linguagens') IS NOT NULL
  PRINT '<<< CREATED TABLE ti.linguagens >>>'
ELSE
  PRINT '<<< FAILED CREATING TABLE ti.linguagens >>>'
go


IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.linguagens') AND name='linIxAk')
BEGIN
  DROP INDEX [ti].[linguagens].[linIxAk]
  PRINT '<<< DROPPED INDEX [ti].[linguagens].[linIxAk] >>>'
END
go

CREATE UNIQUE INDEX [linIxAk] ON [ti].[linguagens]([nome])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.linguagens') AND name='linIxAk')
  PRINT '<<< CREATED INDEX ti.linguagens.linIxAk >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.linguagens.linIxAk >>>'
go

