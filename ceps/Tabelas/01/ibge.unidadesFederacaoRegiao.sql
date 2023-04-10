IF OBJECT_ID('[ibge].[unidadesFederacaoRegiao]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[unidadesFederacaoRegiao]
    PRINT '<<< DROPPED TABLE [ibge].[unidadesFederacaoRegiao] >>>'
END
go
/* 
 * TABLE: [ibge].[unidadesFederacaoRegiao] 
 */

CREATE TABLE [ibge].[unidadesFederacaoRegiao](
    [uniFedRegID]  int    IDENTITY(1,1),
    [regID]        int    NOT NULL,
    [uniFedID]     int    NOT NULL
)
go



IF OBJECT_ID('ibge.unidadesFederacaoRegiao') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.unidadesFederacaoRegiao >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.unidadesFederacaoRegiao >>>'
go

/* 
 * TABLE: [ibge].[unidadesFederacaoRegiao] 
 */

ALTER TABLE [ibge].[unidadesFederacaoRegiao] ADD 
    CONSTRAINT [uniFedRegIxPk] PRIMARY KEY CLUSTERED ([uniFedRegID])
go

IF OBJECT_ID('ibge.unidadesFederacaoRegiao') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.unidadesFederacaoRegiao >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.unidadesFederacaoRegiao >>>'
go

/* 
 * INDEX: [uniFedRegIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.unidadesFederacaoRegiao') AND name='uniFedRegIxAk')
BEGIN
    DROP INDEX [ibge].[unidadesFederacaoRegiao].[uniFedRegIxAk]
    PRINT '<<< DROPPED INDEX [ibge].[unidadesFederacaoRegiao].[uniFedRegIxAk] >>>'
END
go

/* 
 * INDEX: [uniFedRegIxFkReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.unidadesFederacaoRegiao') AND name='uniFedRegIxFkReg')
BEGIN
    DROP INDEX [ibge].[unidadesFederacaoRegiao].[uniFedRegIxFkReg]
    PRINT '<<< DROPPED INDEX [ibge].[unidadesFederacaoRegiao].[uniFedRegIxFkReg] >>>'
END
go

/* 
 * INDEX: [uniFedRegIxFkUniFed] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.unidadesFederacaoRegiao') AND name='uniFedRegIxFkUniFed')
BEGIN
    DROP INDEX [ibge].[unidadesFederacaoRegiao].[uniFedRegIxFkUniFed]
    PRINT '<<< DROPPED INDEX [ibge].[unidadesFederacaoRegiao].[uniFedRegIxFkUniFed] >>>'
END
go

/* 
 * INDEX: [regFkUniFedReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.unidadesFederacaoRegiao') AND name='regFkUniFedReg')
BEGIN
    DROP INDEX [ibge].[unidadesFederacaoRegiao].[regFkUniFedReg]
    PRINT '<<< DROPPED INDEX [ibge].[unidadesFederacaoRegiao].[regFkUniFedReg] >>>'
END
go

/* 
 * INDEX: [uniFedFkUniFedReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.unidadesFederacaoRegiao') AND name='uniFedFkUniFedReg')
BEGIN
    DROP INDEX [ibge].[unidadesFederacaoRegiao].[uniFedFkUniFedReg]
    PRINT '<<< DROPPED INDEX [ibge].[unidadesFederacaoRegiao].[uniFedFkUniFedReg] >>>'
END
go

/* 
 * INDEX: [uniFedRegIxAk] 
 */

CREATE UNIQUE INDEX [uniFedRegIxAk] ON [ibge].[unidadesFederacaoRegiao]([regID], [uniFedID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.unidadesFederacaoRegiao') AND name='uniFedRegIxAk')
    PRINT '<<< CREATED INDEX ibge.unidadesFederacaoRegiao.uniFedRegIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.unidadesFederacaoRegiao.uniFedRegIxAk >>>'
go

/* 
 * INDEX: [uniFedRegIxFkReg] 
 */

CREATE INDEX [uniFedRegIxFkReg] ON [ibge].[unidadesFederacaoRegiao]([regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.unidadesFederacaoRegiao') AND name='uniFedRegIxFkReg')
    PRINT '<<< CREATED INDEX ibge.unidadesFederacaoRegiao.uniFedRegIxFkReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.unidadesFederacaoRegiao.uniFedRegIxFkReg >>>'
go

/* 
 * INDEX: [uniFedRegIxFkUniFed] 
 */

CREATE INDEX [uniFedRegIxFkUniFed] ON [ibge].[unidadesFederacaoRegiao]([uniFedID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.unidadesFederacaoRegiao') AND name='uniFedRegIxFkUniFed')
    PRINT '<<< CREATED INDEX ibge.unidadesFederacaoRegiao.uniFedRegIxFkUniFed >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.unidadesFederacaoRegiao.uniFedRegIxFkUniFed >>>'
go

/* 
 * INDEX: [regFkUniFedReg] 
 */

CREATE INDEX [regFkUniFedReg] ON [ibge].[unidadesFederacaoRegiao]([regID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.unidadesFederacaoRegiao') AND name='regFkUniFedReg')
    PRINT '<<< CREATED INDEX ibge.unidadesFederacaoRegiao.regFkUniFedReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.unidadesFederacaoRegiao.regFkUniFedReg >>>'
go

/* 
 * INDEX: [uniFedFkUniFedReg] 
 */

CREATE INDEX [uniFedFkUniFedReg] ON [ibge].[unidadesFederacaoRegiao]([uniFedID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.unidadesFederacaoRegiao') AND name='uniFedFkUniFedReg')
    PRINT '<<< CREATED INDEX ibge.unidadesFederacaoRegiao.uniFedFkUniFedReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.unidadesFederacaoRegiao.uniFedFkUniFedReg >>>'
go

