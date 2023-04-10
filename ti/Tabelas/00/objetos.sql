USE DataCorp
GO

IF OBJECT_ID('[ti].objBasFkObj') IS NOT NULL
  ALTER TABLE [ti].[objetosBases]
    DROP CONSTRAINT objBasFkObj
go

IF OBJECT_ID('[ti].colObjFkObj') IS NOT NULL
  ALTER TABLE [ti].[colunasObjetos]
    DROP CONSTRAINT colObjFkObj
go

IF OBJECT_ID('[ti].objTipObjFkObj') IS NOT NULL
  ALTER TABLE [ti].[objetosTiposObjetos]
    DROP CONSTRAINT objTipObjFkObj
go

IF OBJECT_ID('[ti].[objetos]') IS NOT NULL
BEGIN
  DROP TABLE [ti].[objetos]
  PRINT '<<< DROPPED TABLE [ti].[objetos] >>>'
END
go


CREATE TABLE [ti].[objetos]
(
  [objId]
    bigint
    IDENTITY(1,1)
    CONSTRAINT [objetosObjIdNn] NOT NULL
, [nome]
    varchar(256)
    CONSTRAINT [objetosNomeNn] NOT NULL
, [descricao]
    varchar(256)
    CONSTRAINT [objetosDescricaoNn] NOT NULL
)
go

IF OBJECT_ID('ti.objetos') IS NOT NULL
  PRINT '<<< CREATED TABLE ti.objetos >>>'
ELSE
  PRINT '<<< FAILED CREATING TABLE ti.objetos >>>'
go


ALTER TABLE [ti].[objetos]
  ADD CONSTRAINT [objPk]
    PRIMARY KEY CLUSTERED ([objId])
go

IF OBJECT_ID('ti.objetos') IS NOT NULL
  PRINT '<<< CREATED TABLE ti.objetos >>>'
ELSE
  PRINT '<<< FAILED CREATING TABLE ti.objetos >>>'
go


IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.objetos') AND name='objIxAk')
BEGIN
  DROP INDEX [ti].[objetos].[objIxAk]
  PRINT '<<< DROPPED INDEX [ti].[objetos].[objIxAk] >>>'
END
go

CREATE UNIQUE INDEX [objIxAk] ON [ti].[objetos]([nome])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.objetos') AND name='objIxAk')
  PRINT '<<< CREATED INDEX ti.objetos.objIxAk >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.objetos.objIxAk >>>'
go

