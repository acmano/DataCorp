USE DataCorp 
GO

IF OBJECT_ID('[ti].funProFkPro') IS NOT NULL
  ALTER TABLE [ti].[funcoesProgramas]
    DROP CONSTRAINT [funProFkPro]
go

IF OBJECT_ID('[ti].funProFkFun') IS NOT NULL
  ALTER TABLE [ti].[funcoesProgramas]
    DROP CONSTRAINT [funProFkFun]
go

IF OBJECT_ID('[ti].colFunFkFunPro') IS NOT NULL
  ALTER TABLE [ti].[colunasFuncoes]
    DROP CONSTRAINT [colFunFkFunPro]
go

IF OBJECT_ID('[ti].[funcoesProgramas]') IS NOT NULL
BEGIN
  DROP TABLE [ti].[funcoesProgramas]
  PRINT '<<< DROPPED TABLE [ti].[funcoesProgramas] >>>'
END
go
/* 
 * TABLE: [ti].[funcoesProgramas] 
 */

CREATE TABLE [ti].[funcoesProgramas](
  [funProId]
    bigint
    IDENTITY(1,1)
    CONSTRAINT [funcoesProgramasFunProIdNn] NOT NULL
, [proId]
    bigint
    CONSTRAINT [funcoesProgramasProIdNn] NOT NULL
, [funId]
    bigint
    CONSTRAINT [funcoesProgramasFunIdNn] NOT NULL
)
go

ALTER TABLE [ti].[funcoesProgramas]
  ADD CONSTRAINT [funProIxPk]
  PRIMARY KEY CLUSTERED ([funProId])
go

IF OBJECT_ID('ti.funcoesProgramas') IS NOT NULL
  PRINT '<<< CREATED TABLE ti.funcoesProgramas >>>'
ELSE
  PRINT '<<< FAILED CREATING TABLE ti.funcoesProgramas >>>'
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.funcoesProgramas') AND name='funProIxAk')
BEGIN
  DROP INDEX [ti].[funcoesProgramas].[funProIxAk]
  PRINT '<<< DROPPED INDEX [ti].[funcoesProgramas].[funProIxAk] >>>'
END
go

CREATE UNIQUE INDEX [funProIxAk] ON [ti].[funcoesProgramas]([proId], [funId])
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.funcoesProgramas') AND name='funProIxAk')
  PRINT '<<< CREATED INDEX ti.funcoesProgramas.funProIxAk >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.funcoesProgramas.funProIxAk >>>'
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.funcoesProgramas') AND name='funProIxFkPro')
BEGIN
  DROP INDEX [ti].[funcoesProgramas].[funProIxFkPro]
  PRINT '<<< DROPPED INDEX [ti].[funcoesProgramas].[funProIxFkPro] >>>'
END
go

CREATE INDEX [funProIxFkPro] ON [ti].[funcoesProgramas]([proId])
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.funcoesProgramas') AND name='funProIxFkPro')
  PRINT '<<< CREATED INDEX ti.funcoesProgramas.funProIxFkPro >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.funcoesProgramas.funProIxFkPro >>>'
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.funcoesProgramas') AND name='funProIxFkFun')
BEGIN
  DROP INDEX [ti].[funcoesProgramas].[funProIxFkFun]
  PRINT '<<< DROPPED INDEX [ti].[funcoesProgramas].[funProIxFkFun] >>>'
END
go

CREATE INDEX [funProIxFkFun] ON [ti].[funcoesProgramas]([funId])
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.funcoesProgramas') AND name='funProIxFkFun')
  PRINT '<<< CREATED INDEX ti.funcoesProgramas.funProIxFkFun >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.funcoesProgramas.funProIxFkFun >>>'
go

ALTER TABLE [ti].[funcoesProgramas]
  ADD CONSTRAINT [funProFkPro] 
    FOREIGN KEY ([proId])
    REFERENCES [ti].[programas]([proId])
go

ALTER TABLE [ti].[funcoesProgramas]
  ADD CONSTRAINT [funProFkFun] 
    FOREIGN KEY ([funId])
    REFERENCES [ti].[funcoes]([funId])
go
