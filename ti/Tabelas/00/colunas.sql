USE DataCorp
GO

IF OBJECT_ID('[ti].colObjFkCol') IS NOT NULL
  ALTER TABLE [ti].[colunasObjetos]
    DROP CONSTRAINT colObjFkCol
go

IF OBJECT_ID('[ti].[colunas]') IS NOT NULL
BEGIN
  DROP TABLE [ti].[colunas]
  PRINT '<<< DROPPED TABLE [ti].[colunas] >>>'
END
go


CREATE TABLE [ti].[colunas]
(
  [colId]
    bigint
    IDENTITY(1,1)
    CONSTRAINT [colunasIdNn] NOT NULL
, [nome]
    varchar(256)
    CONSTRAINT [colunasNomeNn] NOT NULL
, [descricao]
    varchar(256)
    CONSTRAINT [colunasDescricaoNn] NOT NULL
)
go

IF OBJECT_ID('ti.colunas') IS NOT NULL
  PRINT '<<< CREATED TABLE ti.colunas >>>'
ELSE
  PRINT '<<< FAILED CREATING TABLE ti.colunas >>>'
go


ALTER TABLE [ti].[colunas]
  ADD CONSTRAINT [colPk]
    PRIMARY KEY CLUSTERED ([colId])
go

IF OBJECT_ID('ti.colunas') IS NOT NULL
  PRINT '<<< CREATED TABLE ti.colunas >>>'
ELSE
  PRINT '<<< FAILED CREATING TABLE ti.colunas >>>'
go


IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.colunas') AND name='colIxAk')
BEGIN
  DROP INDEX [ti].[colunas].[colIxAk]
  PRINT '<<< DROPPED INDEX [ti].[colunas].[colIxAk] >>>'
END
go

CREATE UNIQUE INDEX [colIxAk] ON [ti].[colunas]([nome])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.colunas') AND name='colIxAk')
  PRINT '<<< CREATED INDEX ti.colunas.colIxAk >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.colunas.colIxAk >>>'
go

