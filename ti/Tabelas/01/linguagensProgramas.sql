USE DataCorp 
GO

IF OBJECT_ID('[ti].linProFkPro') IS NOT NULL
  ALTER TABLE [ti].[linguagensProgramas]
    DROP CONSTRAINT [linProFkPro]
go

IF OBJECT_ID('[ti].linProFkLin') IS NOT NULL
  ALTER TABLE [ti].[linguagensProgramas]
    DROP CONSTRAINT [linProFkLin]
go

IF OBJECT_ID('[ti].[linguagensProgramas]') IS NOT NULL
BEGIN
  DROP TABLE [ti].[linguagensProgramas]
  PRINT '<<< DROPPED TABLE [ti].[linguagensProgramas] >>>'
END
go
/* 
 * TABLE: [ti].[linguagensProgramas] 
 */

CREATE TABLE [ti].[linguagensProgramas](
  [linProId]
    bigint
    IDENTITY(1,1)
    CONSTRAINT [linguagensProgramasLinProIdNn] NOT NULL
, [proId]
    bigint
    CONSTRAINT [linguagensProgramasProIdNn] NOT NULL
, [linId]
    bigint
    CONSTRAINT [linguagensProgramasLinIdNn] NOT NULL
)
go

ALTER TABLE [ti].[linguagensProgramas]
  ADD CONSTRAINT [linProIxPk]
  PRIMARY KEY CLUSTERED ([linProId])
go

IF OBJECT_ID('ti.linguagensProgramas') IS NOT NULL
  PRINT '<<< CREATED TABLE ti.linguagensProgramas >>>'
ELSE
  PRINT '<<< FAILED CREATING TABLE ti.linguagensProgramas >>>'
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.linguagensProgramas') AND name='linProIxAk')
BEGIN
  DROP INDEX [ti].[linguagensProgramas].[linProIxAk]
  PRINT '<<< DROPPED INDEX [ti].[linguagensProgramas].[linProIxAk] >>>'
END
go

CREATE UNIQUE INDEX [linProIxAk] ON [ti].[linguagensProgramas]([proId], [linId])
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.linguagensProgramas') AND name='linProIxAk')
  PRINT '<<< CREATED INDEX ti.linguagensProgramas.linProIxAk >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.linguagensProgramas.linProIxAk >>>'
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.linguagensProgramas') AND name='linProIxFkPro')
BEGIN
  DROP INDEX [ti].[linguagensProgramas].[linProIxFkPro]
  PRINT '<<< DROPPED INDEX [ti].[linguagensProgramas].[linProIxFkPro] >>>'
END
go

CREATE INDEX [linProIxFkPro] ON [ti].[linguagensProgramas]([proId])
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.linguagensProgramas') AND name='linProIxFkPro')
  PRINT '<<< CREATED INDEX ti.linguagensProgramas.linProIxFkPro >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.linguagensProgramas.linProIxFkPro >>>'
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.linguagensProgramas') AND name='linProIxFkLin')
BEGIN
  DROP INDEX [ti].[linguagensProgramas].[linProIxFkLin]
  PRINT '<<< DROPPED INDEX [ti].[linguagensProgramas].[linProIxFkLin] >>>'
END
go

CREATE INDEX [linProIxFkLin] ON [ti].[linguagensProgramas]([linId])
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.linguagensProgramas') AND name='linProIxFkLin')
  PRINT '<<< CREATED INDEX ti.linguagensProgramas.linProIxFkLin >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.linguagensProgramas.linProIxFkLin >>>'
go

ALTER TABLE [ti].[linguagensProgramas]
  ADD CONSTRAINT [linProFkPro] 
    FOREIGN KEY ([proId])
    REFERENCES [ti].[programas]([proId])
go

ALTER TABLE [ti].[linguagensProgramas]
  ADD CONSTRAINT [linProFkLin] 
    FOREIGN KEY ([linId])
    REFERENCES [ti].[linguagens]([linId])
go


