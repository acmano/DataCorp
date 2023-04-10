USE DataCorp 
GO

IF OBJECT_ID('[ti].objOriFkObjBas') IS NOT NULL
  ALTER TABLE [ti].[objetosOrigens]
    DROP CONSTRAINT [objOriFkObjBas]
go

IF OBJECT_ID('[ti].objOriFkObjBasOri') IS NOT NULL
  ALTER TABLE [ti].[objetosOrigens]
    DROP CONSTRAINT [objOriFkObjBasOri]
go

IF OBJECT_ID('[ti].[objetosOrigens]') IS NOT NULL
BEGIN
  DROP TABLE [ti].[objetosOrigens]
  PRINT '<<< DROPPED TABLE [ti].[objetosOrigens] >>>'
END
go
/* 
 * TABLE: [ti].[objetosOrigens] 
 */

CREATE TABLE [ti].[objetosOrigens](
  [objOriId]
    bigint
    IDENTITY(1,1)
    CONSTRAINT [objetosOrigensObjOriIdNn] NOT NULL
, [objBasId]
    bigint
    CONSTRAINT [objetosOrigensObjBasIdNn] NOT NULL
, [objBasOriId]
    bigint
    CONSTRAINT [objetosOrigensObjBasOriIdNn] NOT NULL
)
go

ALTER TABLE [ti].[objetosOrigens]
  ADD CONSTRAINT [objOriIxPk]
  PRIMARY KEY CLUSTERED ([objOriId])
go

IF OBJECT_ID('ti.objetosOrigens') IS NOT NULL
  PRINT '<<< CREATED TABLE ti.objetosOrigens >>>'
ELSE
  PRINT '<<< FAILED CREATING TABLE ti.objetosOrigens >>>'
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.objetosOrigens') AND name='objOriIxAk')
BEGIN
  DROP INDEX [ti].[objetosOrigens].[objOriIxAk]
  PRINT '<<< DROPPED INDEX [ti].[objetosOrigens].[objOriIxAk] >>>'
END
go

CREATE UNIQUE INDEX [objOriIxAk]
  ON [ti].[objetosOrigens]
  (
    [objBasId]
  , [objBasOriId]
  )
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.objetosOrigens') AND name='objOriIxAk')
  PRINT '<<< CREATED INDEX ti.objetosOrigens.objOriIxAk >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.objetosOrigens.objOriIxAk >>>'
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.objetosOrigens') AND name='objOriIxFkObjBas')
BEGIN
  DROP INDEX [ti].[objetosOrigens].[objOriIxFkObjBas]
  PRINT '<<< DROPPED INDEX [ti].[objetosOrigens].[objOriIxFkObjBas] >>>'
END
go

CREATE INDEX [objOriIxFkObjBas]
  ON [ti].[objetosOrigens]
  (
    [objBasId]
  )
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.objetosOrigens') AND name='objOriIxFkObjBas')
  PRINT '<<< CREATED INDEX ti.objetosOrigens.objOriIxFkObjBas >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.objetosOrigens.objOriIxFkObjBas >>>'
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.objetosOrigens') AND name='objOriIxFkObjBasOri')
BEGIN
  DROP INDEX [ti].[objetosOrigens].[objOriIxFkObjBasOri]
  PRINT '<<< DROPPED INDEX [ti].[objetosOrigens].[objOriIxFkObjBasOri] >>>'
END
go

CREATE INDEX [objOriIxFkObjBasOri]
  ON [ti].[objetosOrigens]
  (
    [objBasOriId]
  )
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.objetosOrigens') AND name='objOriIxFkObjBasOri')
  PRINT '<<< CREATED INDEX ti.objetosOrigens.objOriIxFkObjBasOri >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.objetosOrigens.objOriIxFkObjBasOri >>>'
go

ALTER TABLE [ti].[objetosOrigens]
  ADD CONSTRAINT [objOriFkObjBas] 
    FOREIGN KEY ([objBasId])
    REFERENCES [ti].[objetosBases]([objBasId])
go

ALTER TABLE [ti].[objetosOrigens]
  ADD CONSTRAINT [objOriFkObjBasOri] 
    FOREIGN KEY ([objBasOriId])
    REFERENCES [ti].[objetosBases]([objBasId])
go

