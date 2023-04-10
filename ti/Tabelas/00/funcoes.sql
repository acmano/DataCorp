USE DataCorp
GO

IF OBJECT_ID('[ti].funProFkFun') IS NOT NULL
  ALTER TABLE [ti].[funcoesProgramas]
    DROP CONSTRAINT funProFkFun
go

IF OBJECT_ID('[ti].[funcoes]') IS NOT NULL
BEGIN
  DROP TABLE [ti].[funcoes]
  PRINT '<<< DROPPED TABLE [ti].[funcoes] >>>'
END
go


CREATE TABLE [ti].[funcoes]
(
  [funId]
    bigint
    IDENTITY(1,1)
    CONSTRAINT [funcoesFunIdNn] NOT NULL
, [nome]
    varchar(64)
    CONSTRAINT [funcoesNomeNn] NOT NULL
, [descricao]
    varchar(256)
    CONSTRAINT [funcoesDescricaoNn] NOT NULL
)
go

IF OBJECT_ID('ti.funcoes') IS NOT NULL
  PRINT '<<< CREATED TABLE ti.funcoes >>>'
ELSE
  PRINT '<<< FAILED CREATING TABLE ti.funcoes >>>'
go


ALTER TABLE [ti].[funcoes]
  ADD CONSTRAINT [funPk]
    PRIMARY KEY CLUSTERED ([funId])
go

IF OBJECT_ID('ti.funcoes') IS NOT NULL
  PRINT '<<< CREATED TABLE ti.funcoes >>>'
ELSE
  PRINT '<<< FAILED CREATING TABLE ti.funcoes >>>'
go


IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.funcoes') AND name='funIxAk')
BEGIN
  DROP INDEX [ti].[funcoes].[funIxAk]
  PRINT '<<< DROPPED INDEX [ti].[funcoes].[funIxAk] >>>'
END
go

CREATE UNIQUE INDEX [funIxAk] ON [ti].[funcoes]([nome])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.funcoes') AND name='funIxAk')
  PRINT '<<< CREATED INDEX ti.funcoes.funIxAk >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.funcoes.funIxAk >>>'
go

