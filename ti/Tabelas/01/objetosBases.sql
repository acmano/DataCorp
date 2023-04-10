USE DataCorp 
GO

IF OBJECT_ID('[ti].objBasFkBas') IS NOT NULL
  ALTER TABLE [ti].[objetosBases]
    DROP CONSTRAINT [objBasFkBas]
go

IF OBJECT_ID('[ti].objBasFkObj') IS NOT NULL
  ALTER TABLE [ti].[objetosBases]
    DROP CONSTRAINT [objBasFkObj]
go

IF OBJECT_ID('[ti].objOriFkObjBas') IS NOT NULL
  ALTER TABLE [ti].[objetosOrigens]
    DROP CONSTRAINT [objOriFkObjBas]
go

IF OBJECT_ID('[ti].objOriFkObjBasOri') IS NOT NULL
  ALTER TABLE [ti].[objetosOrigens]
    DROP CONSTRAINT [objOriFkObjBasOri]
go

IF OBJECT_ID('[ti].[objetosBases]') IS NOT NULL
BEGIN
  DROP TABLE [ti].[objetosBases]
  PRINT '<<< DROPPED TABLE [ti].[objetosBases] >>>'
END
go

CREATE TABLE [ti].[objetosBases]
(

  [objBasId]
    bigint
    IDENTITY(1,1)
    CONSTRAINT [objetosBasesBasBanIdNn] NOT NULL

, [basId]
    bigint
    CONSTRAINT [objetosBasesBasIdNn] NOT NULL

, [objId]
    bigint
    CONSTRAINT [objetosBasesObjIdNn] NOT NULL

)
go

ALTER TABLE [ti].[objetosBases]
  ADD CONSTRAINT [objBasIxPk]
  PRIMARY KEY CLUSTERED ([objBasId])
go

IF OBJECT_ID('ti.objetosBases') IS NOT NULL
  PRINT '<<< CREATED TABLE ti.objetosBases >>>'
ELSE
  PRINT '<<< FAILED CREATING TABLE ti.objetosBases >>>'
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.objetosBases') AND name='objBasIxAk')
BEGIN
  DROP INDEX [ti].[objetosBases].[objBasIxAk]
  PRINT '<<< DROPPED INDEX [ti].[objetosBases].[objBasIxAk] >>>'
END
go

CREATE UNIQUE INDEX [objBasIxAk]
  ON [ti].[objetosBases]
  (
    [basId]
  , [objId]
  )
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.objetosBases') AND name='objBasIxAk')
  PRINT '<<< CREATED INDEX ti.objetosBases.objBasIxAk >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.objetosBases.objBasIxAk >>>'
go


IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.objetosBases') AND name='objBasIxFkBas')
BEGIN
  DROP INDEX [ti].[objetosBases].[objBasIxFkBas]
  PRINT '<<< DROPPED INDEX [ti].[objetosBases].[objBasIxFkBas] >>>'
END
go

CREATE INDEX [objBasIxFkBas]
  ON [ti].[objetosBases]
  (
    [basId]
  )
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.objetosBases') AND name='objBasIxFkBas')
  PRINT '<<< CREATED INDEX ti.objetosBases.objBasIxFkBas >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.objetosBases.objBasIxFkBas >>>'
go


IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.objetosBases') AND name='objBasIxFkObj')
BEGIN
  DROP INDEX [ti].[objetosBases].[objBasIxFkObj]
  PRINT '<<< DROPPED INDEX [ti].[objetosBases].[objBasIxFkObj] >>>'
END
go

CREATE INDEX [objBasIxFkObj]
  ON [ti].[objetosBases]
  (
    [objId]
  )
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.objetosBases') AND name='objBasIxFkObj')
  PRINT '<<< CREATED INDEX ti.objetosBases.objBasIxFkObj >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.objetosBases.objBasIxFkObj >>>'
go

ALTER TABLE [ti].[objetosBases]
  ADD CONSTRAINT [objBasFkBas] 
    FOREIGN KEY ([basId])
    REFERENCES [ti].[bases]([basId])
go

ALTER TABLE [ti].[objetosBases]
  ADD CONSTRAINT [objBasFkObj] 
    FOREIGN KEY ([objId])
    REFERENCES [ti].[Objetos]([objId])
go

