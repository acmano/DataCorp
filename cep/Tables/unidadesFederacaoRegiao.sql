IF OBJECT_ID('[unidadesFederacaoRegiao]') IS NOT NULL
BEGIN
    DROP TABLE [unidadesFederacaoRegiao]
    PRINT '<<< DROPPED TABLE [unidadesFederacaoRegiao] >>>'
END
go
/* 
 * TABLE: [unidadesFederacaoRegiao] 
 */

CREATE TABLE [unidadesFederacaoRegiao](
    [uniFedRegID]  int    IDENTITY(1,1),
    [regID]        int    NOT NULL,
    [uniFedID]     int    NOT NULL
)
go



IF OBJECT_ID('unidadesFederacaoRegiao') IS NOT NULL
    PRINT '<<< CREATED TABLE unidadesFederacaoRegiao >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE unidadesFederacaoRegiao >>>'
go

/* 
 * TABLE: [unidadesFederacaoRegiao] 
 */

ALTER TABLE [unidadesFederacaoRegiao] ADD 
    CONSTRAINT [uniFedRegIxPk] PRIMARY KEY CLUSTERED ([uniFedRegID])
go

IF OBJECT_ID('unidadesFederacaoRegiao') IS NOT NULL
    PRINT '<<< CREATED TABLE unidadesFederacaoRegiao >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE unidadesFederacaoRegiao >>>'
go

/* 
 * INDEX: [uniFedRegIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('unidadesFederacaoRegiao') AND name='uniFedRegIxAk')
BEGIN
    DROP INDEX [unidadesFederacaoRegiao].[uniFedRegIxAk]
    PRINT '<<< DROPPED INDEX [unidadesFederacaoRegiao].[uniFedRegIxAk] >>>'
END
go

/* 
 * INDEX: [uniFedRegIxFkReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('unidadesFederacaoRegiao') AND name='uniFedRegIxFkReg')
BEGIN
    DROP INDEX [unidadesFederacaoRegiao].[uniFedRegIxFkReg]
    PRINT '<<< DROPPED INDEX [unidadesFederacaoRegiao].[uniFedRegIxFkReg] >>>'
END
go

/* 
 * INDEX: [uniFedRegIxFkUniFed] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('unidadesFederacaoRegiao') AND name='uniFedRegIxFkUniFed')
BEGIN
    DROP INDEX [unidadesFederacaoRegiao].[uniFedRegIxFkUniFed]
    PRINT '<<< DROPPED INDEX [unidadesFederacaoRegiao].[uniFedRegIxFkUniFed] >>>'
END
go

/* 
 * INDEX: [regFkUniFedReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('unidadesFederacaoRegiao') AND name='regFkUniFedReg')
BEGIN
    DROP INDEX [unidadesFederacaoRegiao].[regFkUniFedReg]
    PRINT '<<< DROPPED INDEX [unidadesFederacaoRegiao].[regFkUniFedReg] >>>'
END
go

/* 
 * INDEX: [uniFedFkUniFedReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('unidadesFederacaoRegiao') AND name='uniFedFkUniFedReg')
BEGIN
    DROP INDEX [unidadesFederacaoRegiao].[uniFedFkUniFedReg]
    PRINT '<<< DROPPED INDEX [unidadesFederacaoRegiao].[uniFedFkUniFedReg] >>>'
END
go

/* 
 * INDEX: [uniFedRegIxAk] 
 */

CREATE UNIQUE INDEX [uniFedRegIxAk] ON [unidadesFederacaoRegiao]([regID], [uniFedID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('unidadesFederacaoRegiao') AND name='uniFedRegIxAk')
    PRINT '<<< CREATED INDEX unidadesFederacaoRegiao.uniFedRegIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX unidadesFederacaoRegiao.uniFedRegIxAk >>>'
go

/* 
 * INDEX: [uniFedRegIxFkReg] 
 */

CREATE INDEX [uniFedRegIxFkReg] ON [unidadesFederacaoRegiao]([regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('unidadesFederacaoRegiao') AND name='uniFedRegIxFkReg')
    PRINT '<<< CREATED INDEX unidadesFederacaoRegiao.uniFedRegIxFkReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX unidadesFederacaoRegiao.uniFedRegIxFkReg >>>'
go

/* 
 * INDEX: [uniFedRegIxFkUniFed] 
 */

CREATE INDEX [uniFedRegIxFkUniFed] ON [unidadesFederacaoRegiao]([uniFedID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('unidadesFederacaoRegiao') AND name='uniFedRegIxFkUniFed')
    PRINT '<<< CREATED INDEX unidadesFederacaoRegiao.uniFedRegIxFkUniFed >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX unidadesFederacaoRegiao.uniFedRegIxFkUniFed >>>'
go

/* 
 * INDEX: [regFkUniFedReg] 
 */

CREATE INDEX [regFkUniFedReg] ON [unidadesFederacaoRegiao]([regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('unidadesFederacaoRegiao') AND name='regFkUniFedReg')
    PRINT '<<< CREATED INDEX unidadesFederacaoRegiao.regFkUniFedReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX unidadesFederacaoRegiao.regFkUniFedReg >>>'
go

/* 
 * INDEX: [uniFedFkUniFedReg] 
 */

CREATE INDEX [uniFedFkUniFedReg] ON [unidadesFederacaoRegiao]([uniFedID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('unidadesFederacaoRegiao') AND name='uniFedFkUniFedReg')
    PRINT '<<< CREATED INDEX unidadesFederacaoRegiao.uniFedFkUniFedReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX unidadesFederacaoRegiao.uniFedFkUniFedReg >>>'
go

