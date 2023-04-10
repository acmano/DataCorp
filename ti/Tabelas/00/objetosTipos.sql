USE DataCorp 
GO

IF OBJECT_ID('[ti].objTipObjFkObjTip') IS NOT NULL
  ALTER TABLE [ti].[objetosTiposObjetos]
    DROP CONSTRAINT objTipObjFkObjTip
go

IF OBJECT_ID('[ti].[objetosTipos]') IS NOT NULL
BEGIN
  DROP TABLE [ti].[objetosTipos]
  PRINT '<<< DROPPED TABLE [ti].[objetosTipos] >>>'
END
go


CREATE TABLE [ti].[objetosTipos]
(
  [objTipId]
    bigint
    IDENTITY(1,1)
    CONSTRAINT [objetosTiposObjTipIdNn] NOT NULL
, [codigo]
    char(2)
    CONSTRAINT [objetosTiposCodigoNn] NOT NULL
, [descricao]
    varchar(128)
    CONSTRAINT [objetosTiposDescricaoNn] NOT NULL
)
go

IF OBJECT_ID('ti.objetosTipos') IS NOT NULL
  PRINT '<<< CREATED TABLE ti.objetosTipos >>>'
ELSE
  PRINT '<<< FAILED CREATING TABLE ti.objetosTipos >>>'
go


ALTER TABLE [ti].[objetosTipos]
  ADD CONSTRAINT [objTipPk]
    PRIMARY KEY CLUSTERED ([objTipId])
go

IF OBJECT_ID('ti.objetosTipos') IS NOT NULL
  PRINT '<<< CREATED TABLE ti.objetosTipos >>>'
ELSE
  PRINT '<<< FAILED CREATING TABLE ti.objetosTipos >>>'
go


IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.objetosTipos') AND name='objTipIxAk')
BEGIN
  DROP INDEX [ti].[objetosTipos].[objTipIxAk]
  PRINT '<<< DROPPED INDEX [ti].[objetosTipos].[objTipIxAk] >>>'
END
go

CREATE UNIQUE INDEX [objTipIxAk] ON [ti].[objetosTipos]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.objetosTipos') AND name='objTipIxAk')
  PRINT '<<< CREATED INDEX ti.objetosTipos.objTipIxAk >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.objetosTipos.objTipIxAk >>>'
go

