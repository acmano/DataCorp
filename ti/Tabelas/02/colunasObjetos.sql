USE DataCorp 
GO

IF OBJECT_ID('[ti].colObjFkObj') IS NOT NULL
  ALTER TABLE [ti].[colunasObjetos]
    DROP CONSTRAINT [colObjFkObj]
go

IF OBJECT_ID('[ti].colObjFkObj') IS NOT NULL
  ALTER TABLE [ti].[colunasObjetos]
    DROP CONSTRAINT [colObjFkObj]
go

IF OBJECT_ID('[ti].colFunFkColObj') IS NOT NULL
  ALTER TABLE [ti].[colunasFuncoes]
    DROP CONSTRAINT [colFunFkColObj]
go

IF OBJECT_ID('[ti].[colunasObjetos]') IS NOT NULL
BEGIN
  DROP TABLE [ti].[colunasObjetos]
  PRINT '<<< DROPPED TABLE [ti].[colunasObjetos] >>>'
END
go
/* 
 * TABLE: [ti].[colunasObjetos] 
 */

CREATE TABLE [ti].[colunasObjetos](
  [colObjId]
    bigint
    IDENTITY(1,1)
    CONSTRAINT [colunasObjetosColObjIdNn] NOT NULL
, [objId]
    bigint
    CONSTRAINT [colunasObjetosObjIdNn] NOT NULL
, [colId]
    bigint
    CONSTRAINT [colunasObjetosColIdNn] NOT NULL
)
go

ALTER TABLE [ti].[colunasObjetos]
  ADD CONSTRAINT [colObjIxPk]
  PRIMARY KEY CLUSTERED ([colObjId])
go

IF OBJECT_ID('ti.colunasObjetos') IS NOT NULL
  PRINT '<<< CREATED TABLE ti.colunasObjetos >>>'
ELSE
  PRINT '<<< FAILED CREATING TABLE ti.colunasObjetos >>>'
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.colunasObjetos') AND name='colObjIxAk')
BEGIN
  DROP INDEX [ti].[colunasObjetos].[colObjIxAk]
  PRINT '<<< DROPPED INDEX [ti].[colunasObjetos].[colObjIxAk] >>>'
END
go

CREATE UNIQUE INDEX [colObjIxAk] ON [ti].[colunasObjetos]([objId], [colId])
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.colunasObjetos') AND name='colObjIxAk')
  PRINT '<<< CREATED INDEX ti.colunasObjetos.colObjIxAk >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.colunasObjetos.colObjIxAk >>>'
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.colunasObjetos') AND name='colObjIxFkObj')
BEGIN
  DROP INDEX [ti].[colunasObjetos].[colObjIxFkObj]
  PRINT '<<< DROPPED INDEX [ti].[colunasObjetos].[colObjIxFkObj] >>>'
END
go

CREATE INDEX [colObjIxFkObj] ON [ti].[colunasObjetos]([objId])
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.colunasObjetos') AND name='colObjIxFkObj')
  PRINT '<<< CREATED INDEX ti.colunasObjetos.colObjIxFkObj >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.colunasObjetos.colObjIxFkObj >>>'
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.colunasObjetos') AND name='colObjIxFkCol')
BEGIN
  DROP INDEX [ti].[colunasObjetos].[colObjIxFkCol]
  PRINT '<<< DROPPED INDEX [ti].[colunasObjetos].[colObjIxFkCol] >>>'
END
go

CREATE INDEX [colObjIxFkCol] ON [ti].[colunasObjetos]([colId])
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.colunasObjetos') AND name='colObjIxFkCol')
  PRINT '<<< CREATED INDEX ti.colunasObjetos.colObjIxFkCol >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.colunasObjetos.colObjIxFkCol >>>'
go

ALTER TABLE [ti].[colunasObjetos]
  ADD CONSTRAINT [colObjFkObj] 
    FOREIGN KEY ([objId])
    REFERENCES [ti].[objetos]([objId])
go

ALTER TABLE [ti].[colunasObjetos]
  ADD CONSTRAINT [colObjFkCol] 
    FOREIGN KEY ([colId])
    REFERENCES [ti].[colunas]([colId])
go

