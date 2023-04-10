IF OBJECT_ID('[mesoRegioesUnidadeFederacao]') IS NOT NULL
BEGIN
    DROP TABLE [mesoRegioesUnidadeFederacao]
    PRINT '<<< DROPPED TABLE [mesoRegioesUnidadeFederacao] >>>'
END
go
/* 
 * TABLE: [mesoRegioesUnidadeFederacao] 
 */

CREATE TABLE [mesoRegioesUnidadeFederacao](
    [mesRegUniFedID]  int    IDENTITY(1,1),
    [uniFedID]        int    NOT NULL,
    [mesRegID]        int    NOT NULL
)
go



IF OBJECT_ID('mesoRegioesUnidadeFederacao') IS NOT NULL
    PRINT '<<< CREATED TABLE mesoRegioesUnidadeFederacao >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE mesoRegioesUnidadeFederacao >>>'
go

/* 
 * TABLE: [mesoRegioesUnidadeFederacao] 
 */

ALTER TABLE [mesoRegioesUnidadeFederacao] ADD 
    CONSTRAINT [msRegUniFedIxPk] PRIMARY KEY CLUSTERED ([mesRegUniFedID])
go

IF OBJECT_ID('mesoRegioesUnidadeFederacao') IS NOT NULL
    PRINT '<<< CREATED TABLE mesoRegioesUnidadeFederacao >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE mesoRegioesUnidadeFederacao >>>'
go

/* 
 * INDEX: [mesRegUniFedIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('mesoRegioesUnidadeFederacao') AND name='mesRegUniFedIxAk')
BEGIN
    DROP INDEX [mesoRegioesUnidadeFederacao].[mesRegUniFedIxAk]
    PRINT '<<< DROPPED INDEX [mesoRegioesUnidadeFederacao].[mesRegUniFedIxAk] >>>'
END
go

/* 
 * INDEX: [mesRegIxFkUniFed] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('mesoRegioesUnidadeFederacao') AND name='mesRegIxFkUniFed')
BEGIN
    DROP INDEX [mesoRegioesUnidadeFederacao].[mesRegIxFkUniFed]
    PRINT '<<< DROPPED INDEX [mesoRegioesUnidadeFederacao].[mesRegIxFkUniFed] >>>'
END
go

/* 
 * INDEX: [mesRegIxFkMesReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('mesoRegioesUnidadeFederacao') AND name='mesRegIxFkMesReg')
BEGIN
    DROP INDEX [mesoRegioesUnidadeFederacao].[mesRegIxFkMesReg]
    PRINT '<<< DROPPED INDEX [mesoRegioesUnidadeFederacao].[mesRegIxFkMesReg] >>>'
END
go

/* 
 * INDEX: [uniFedFkMesRegUniFed] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('mesoRegioesUnidadeFederacao') AND name='uniFedFkMesRegUniFed')
BEGIN
    DROP INDEX [mesoRegioesUnidadeFederacao].[uniFedFkMesRegUniFed]
    PRINT '<<< DROPPED INDEX [mesoRegioesUnidadeFederacao].[uniFedFkMesRegUniFed] >>>'
END
go

/* 
 * INDEX: [mesRegFkMesRegUniFed] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('mesoRegioesUnidadeFederacao') AND name='mesRegFkMesRegUniFed')
BEGIN
    DROP INDEX [mesoRegioesUnidadeFederacao].[mesRegFkMesRegUniFed]
    PRINT '<<< DROPPED INDEX [mesoRegioesUnidadeFederacao].[mesRegFkMesRegUniFed] >>>'
END
go

/* 
 * INDEX: [mesRegUniFedIxAk] 
 */

CREATE UNIQUE INDEX [mesRegUniFedIxAk] ON [mesoRegioesUnidadeFederacao]([uniFedID], [mesRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('mesoRegioesUnidadeFederacao') AND name='mesRegUniFedIxAk')
    PRINT '<<< CREATED INDEX mesoRegioesUnidadeFederacao.mesRegUniFedIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX mesoRegioesUnidadeFederacao.mesRegUniFedIxAk >>>'
go

/* 
 * INDEX: [mesRegIxFkUniFed] 
 */

CREATE INDEX [mesRegIxFkUniFed] ON [mesoRegioesUnidadeFederacao]([uniFedID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('mesoRegioesUnidadeFederacao') AND name='mesRegIxFkUniFed')
    PRINT '<<< CREATED INDEX mesoRegioesUnidadeFederacao.mesRegIxFkUniFed >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX mesoRegioesUnidadeFederacao.mesRegIxFkUniFed >>>'
go

/* 
 * INDEX: [mesRegIxFkMesReg] 
 */

CREATE INDEX [mesRegIxFkMesReg] ON [mesoRegioesUnidadeFederacao]([mesRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('mesoRegioesUnidadeFederacao') AND name='mesRegIxFkMesReg')
    PRINT '<<< CREATED INDEX mesoRegioesUnidadeFederacao.mesRegIxFkMesReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX mesoRegioesUnidadeFederacao.mesRegIxFkMesReg >>>'
go

/* 
 * INDEX: [uniFedFkMesRegUniFed] 
 */

CREATE INDEX [uniFedFkMesRegUniFed] ON [mesoRegioesUnidadeFederacao]([uniFedID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('mesoRegioesUnidadeFederacao') AND name='uniFedFkMesRegUniFed')
    PRINT '<<< CREATED INDEX mesoRegioesUnidadeFederacao.uniFedFkMesRegUniFed >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX mesoRegioesUnidadeFederacao.uniFedFkMesRegUniFed >>>'
go

/* 
 * INDEX: [mesRegFkMesRegUniFed] 
 */

CREATE INDEX [mesRegFkMesRegUniFed] ON [mesoRegioesUnidadeFederacao]([mesRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('mesoRegioesUnidadeFederacao') AND name='mesRegFkMesRegUniFed')
    PRINT '<<< CREATED INDEX mesoRegioesUnidadeFederacao.mesRegFkMesRegUniFed >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX mesoRegioesUnidadeFederacao.mesRegFkMesRegUniFed >>>'
go

