USE DataCorp 
GO

IF OBJECT_ID('[ti].colFunFkColObj') IS NOT NULL
  ALTER TABLE [ti].[colunasFuncoes]
    DROP CONSTRAINT [colFunFkColObj]
go

IF OBJECT_ID('[ti].colFunFkFunPro') IS NOT NULL
  ALTER TABLE [ti].[colunasFuncoes]
    DROP CONSTRAINT [colFunFkFunPro]
go

IF OBJECT_ID('[ti].[colunasFuncoes]') IS NOT NULL
BEGIN
  DROP TABLE [ti].[colunasFuncoes]
  PRINT '<<< DROPPED TABLE [ti].[colunasFuncoes] >>>'
END
go
/* 
 * TABLE: [ti].[colunasFuncoes] 
 */

CREATE TABLE [ti].[colunasFuncoes](
  [colFunId]
    bigint
    IDENTITY(1,1)
    CONSTRAINT [colunasFuncoesColFunIdNn] NOT NULL
, [funProId]
    bigint
    CONSTRAINT [colunasFuncoesFunProIdNn] NOT NULL
, [colObjId]
    bigint
    CONSTRAINT [colunasFuncoesColObjIdNn] NOT NULL
, [grava]       --  Create
    char(1)
    CONSTRAINT [colunasFuncoesGravaNn] NOT NULL
, [le]          --  Read
    char(1)
    CONSTRAINT [colunasFuncoesLeNn] NOT NULL
, [atualiza]    --  Update
    char(1)
    CONSTRAINT [colunasFuncoesAtualizaNn] NOT NULL
, [exclui]      --  Delete
    char(1)
    CONSTRAINT [colunasFuncoesExcluiNn] NOT NULL
)
go

ALTER TABLE [ti].[colunasFuncoes]
  ADD CONSTRAINT [colFunIxPk]
  PRIMARY KEY CLUSTERED ([colFunId])
go

IF OBJECT_ID('ti.colunasFuncoes') IS NOT NULL
  PRINT '<<< CREATED TABLE ti.colunasFuncoes >>>'
ELSE
  PRINT '<<< FAILED CREATING TABLE ti.colunasFuncoes >>>'
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.colunasFuncoes') AND name='colFunIxAk')
BEGIN
  DROP INDEX [ti].[colunasFuncoes].[colFunIxAk]
  PRINT '<<< DROPPED INDEX [ti].[colunasFuncoes].[colFunIxAk] >>>'
END
go

CREATE UNIQUE INDEX [colFunIxAk]
  ON [ti].[colunasFuncoes]
  (
    [funProId]
  , [colObjId]
  )
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.colunasFuncoes') AND name='colFunIxAk')
  PRINT '<<< CREATED INDEX ti.colunasFuncoes.colFunIxAk >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.colunasFuncoes.colFunIxAk >>>'
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.colunasFuncoes') AND name='colFunIxFkFunPro')
BEGIN
  DROP INDEX [ti].[colunasFuncoes].[colFunIxFkFunPro]
  PRINT '<<< DROPPED INDEX [ti].[colunasFuncoes].[colFunIxFkFunPro] >>>'
END
go

CREATE INDEX [colFunIxFkFunPro]
  ON [ti].[colunasFuncoes]
  (
    [funProId]
  )
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.colunasFuncoes') AND name='colFunIxFkFunPro')
  PRINT '<<< CREATED INDEX ti.colunasFuncoes.colFunIxFkFunPro >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.colunasFuncoes.colFunIxFkFunPro >>>'
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.colunasFuncoes') AND name='colFunIxFkColObj')
BEGIN
  DROP INDEX [ti].[colunasFuncoes].[colFunIxFkColObj]
  PRINT '<<< DROPPED INDEX [ti].[colunasFuncoes].[colFunIxFkColObj] >>>'
END
go

CREATE INDEX [colFunIxFkColObj]
  ON [ti].[colunasFuncoes]
  (
    [colObjId]
  )
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.colunasFuncoes') AND name='colFunIxFkColObj')
  PRINT '<<< CREATED INDEX ti.colunasFuncoes.colFunIxFkColObj >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.colunasFuncoes.colFunIxFkColObj >>>'
go

ALTER TABLE [ti].[colunasFuncoes]
  ADD CONSTRAINT [colFunFkFunPro] 
    FOREIGN KEY ([funProId])
    REFERENCES [ti].[funcoesProgramas]([funProId])
go

ALTER TABLE [ti].[colunasFuncoes]
  ADD CONSTRAINT [colFunFkColObj] 
    FOREIGN KEY ([colObjId])
    REFERENCES [ti].[colunasObjetos]([colObjId])
go

