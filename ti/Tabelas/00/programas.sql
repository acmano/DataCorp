USE DataCorp 
GO

IF OBJECT_ID('[ti].proSisFkPro') IS NOT NULL
  ALTER TABLE [ti].[programasSistemas]
    DROP CONSTRAINT proSisFkPro
go

IF OBJECT_ID('[ti].funProFkPro') IS NOT NULL
  ALTER TABLE [ti].[funcoesProgramas]
    DROP CONSTRAINT funProFkPro
go

IF OBJECT_ID('[ti].[programas]') IS NOT NULL
BEGIN
  DROP TABLE [ti].[programas]
  PRINT '<<< DROPPED TABLE [ti].[programas] >>>'
END
go


CREATE TABLE [ti].[programas]
(
  [proId]
    bigint
    IDENTITY(1,1)
    CONSTRAINT [programasProIdNn] NOT NULL
, [nome]
    varchar(64)
    CONSTRAINT [programasNomeNn] NOT NULL
, [descricao]
    varchar(256)
    CONSTRAINT [programasDescricaoNn] NOT NULL
)
go

IF OBJECT_ID('ti.programas') IS NOT NULL
  PRINT '<<< CREATED TABLE ti.programas >>>'
ELSE
  PRINT '<<< FAILED CREATING TABLE ti.programas >>>'
go


ALTER TABLE [ti].[programas]
  ADD CONSTRAINT [proPk]
    PRIMARY KEY CLUSTERED ([proId])
go

IF OBJECT_ID('ti.programas') IS NOT NULL
  PRINT '<<< CREATED TABLE ti.programas >>>'
ELSE
  PRINT '<<< FAILED CREATING TABLE ti.programas >>>'
go


IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.programas') AND name='proIxAk')
BEGIN
  DROP INDEX [ti].[programas].[proIxAk]
  PRINT '<<< DROPPED INDEX [ti].[programas].[proIxAk] >>>'
END
go

CREATE UNIQUE INDEX [proIxAk] ON [ti].[programas]([nome])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.programas') AND name='proIxAk')
  PRINT '<<< CREATED INDEX ti.programas.proIxAk >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.programas.proIxAk >>>'
go

