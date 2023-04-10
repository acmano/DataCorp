USE DataCorp 
GO

IF OBJECT_ID('[ti].objTipObjFkObj') IS NOT NULL
  ALTER TABLE [ti].[objetosTiposObjetos]
    DROP CONSTRAINT [objTipObjFkObj]
go

IF OBJECT_ID('[ti].objTipObjFkObjTip') IS NOT NULL
  ALTER TABLE [ti].[objetosTiposObjetos]
    DROP CONSTRAINT [objTipObjFkObjTip]
go

IF OBJECT_ID('[ti].[objetosTiposObjetos]') IS NOT NULL
BEGIN
  DROP TABLE [ti].[objetosTiposObjetos]
  PRINT '<<< DROPPED TABLE [ti].[objetosTiposObjetos] >>>'
END
go

CREATE TABLE [ti].[objetosTiposObjetos]
(

  [objTipObjId]
    bigint
    IDENTITY(1,1)
    CONSTRAINT [objetosTiposObjetosObjTipObjIdNn] NOT NULL

, [objTipId]
    bigint
    CONSTRAINT [objetosTiposObjetosObjTipIdNn] NOT NULL

, [objId]
    bigint
    CONSTRAINT [objetosTiposObjetosObjIdNn] NOT NULL

)
go

ALTER TABLE [ti].[objetosTiposObjetos]
  ADD CONSTRAINT [objTipObjIxPk]
  PRIMARY KEY CLUSTERED ([objTipObjId])
go

IF OBJECT_ID('ti.objetosTiposObjetos') IS NOT NULL
  PRINT '<<< CREATED TABLE ti.objetosTiposObjetos >>>'
ELSE
  PRINT '<<< FAILED CREATING TABLE ti.objetosTiposObjetos >>>'
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.objetosTiposObjetos') AND name='objTipObjIxAk')
BEGIN
  DROP INDEX [ti].[objetosTiposObjetos].[objTipObjIxAk]
  PRINT '<<< DROPPED INDEX [ti].[objetosTiposObjetos].[objTipObjIxAk] >>>'
END
go

CREATE UNIQUE INDEX [objTipObjIxAk]
  ON [ti].[objetosTiposObjetos]
  (
    [objTipId]
  , [objId]
  )
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.objetosTiposObjetos') AND name='objTipObjIxAk')
  PRINT '<<< CREATED INDEX ti.objetosTiposObjetos.objTipObjIxAk >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.objetosTiposObjetos.objTipObjIxAk >>>'
go


IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.objetosTiposObjetos') AND name='objTipObjIxFkObjTip')
BEGIN
  DROP INDEX [ti].[objetosTiposObjetos].[objTipObjIxFkObjTip]
  PRINT '<<< DROPPED INDEX [ti].[objetosTiposObjetos].[objTipObjIxFkObjTip] >>>'
END
go

CREATE INDEX [objTipObjIxFkObjTip]
  ON [ti].[objetosTiposObjetos]
  (
    [objTipId]
  )
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.objetosTiposObjetos') AND name='objTipObjIxFkObjTip')
  PRINT '<<< CREATED INDEX ti.objetosTiposObjetos.objTipObjIxFkObjTip >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.objetosTiposObjetos.objTipObjIxFkObjTip >>>'
go


IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.objetosTiposObjetos') AND name='objTipObjIxFkObj')
BEGIN
  DROP INDEX [ti].[objetosTiposObjetos].[objTipObjIxFkObj]
  PRINT '<<< DROPPED INDEX [ti].[objetosTiposObjetos].[objTipObjIxFkObj] >>>'
END
go

CREATE INDEX [objTipObjIxFkObj]
  ON [ti].[objetosTiposObjetos]
  (
    [objId]
  )
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.objetosTiposObjetos') AND name='objTipObjIxFkObj')
  PRINT '<<< CREATED INDEX ti.objetosTiposObjetos.objTipObjIxFkObj >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.objetosTiposObjetos.objTipObjIxFkObj >>>'
go

ALTER TABLE [ti].[objetosTiposObjetos]
  ADD CONSTRAINT [objTipObjFkObjTip] 
    FOREIGN KEY ([objTipId])
    REFERENCES [ti].[objetosTipos]([objTipId])
go

ALTER TABLE [ti].[objetosTiposObjetos]
  ADD CONSTRAINT [objTipObjFkObj] 
    FOREIGN KEY ([objId])
    REFERENCES [ti].[Objetos]([objId])
go


