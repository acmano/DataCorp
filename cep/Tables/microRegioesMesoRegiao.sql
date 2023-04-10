IF OBJECT_ID('[microRegioesMesoRegiao]') IS NOT NULL
BEGIN
    DROP TABLE [microRegioesMesoRegiao]
    PRINT '<<< DROPPED TABLE [microRegioesMesoRegiao] >>>'
END
go
/* 
 * TABLE: [microRegioesMesoRegiao] 
 */

CREATE TABLE [microRegioesMesoRegiao](
    [micRegMesRegID]  int    IDENTITY(1,1),
    [mesRegID]        int    NOT NULL,
    [micRegID]        int    NOT NULL
)
go



IF OBJECT_ID('microRegioesMesoRegiao') IS NOT NULL
    PRINT '<<< CREATED TABLE microRegioesMesoRegiao >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE microRegioesMesoRegiao >>>'
go

/* 
 * TABLE: [microRegioesMesoRegiao] 
 */

ALTER TABLE [microRegioesMesoRegiao] ADD 
    CONSTRAINT [micRegMesRegIxPk] PRIMARY KEY CLUSTERED ([micRegMesRegID])
go

IF OBJECT_ID('microRegioesMesoRegiao') IS NOT NULL
    PRINT '<<< CREATED TABLE microRegioesMesoRegiao >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE microRegioesMesoRegiao >>>'
go

/* 
 * INDEX: [micRegMesRegIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('microRegioesMesoRegiao') AND name='micRegMesRegIxAk')
BEGIN
    DROP INDEX [microRegioesMesoRegiao].[micRegMesRegIxAk]
    PRINT '<<< DROPPED INDEX [microRegioesMesoRegiao].[micRegMesRegIxAk] >>>'
END
go

/* 
 * INDEX: [micRegMesRegIxFkMesReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('microRegioesMesoRegiao') AND name='micRegMesRegIxFkMesReg')
BEGIN
    DROP INDEX [microRegioesMesoRegiao].[micRegMesRegIxFkMesReg]
    PRINT '<<< DROPPED INDEX [microRegioesMesoRegiao].[micRegMesRegIxFkMesReg] >>>'
END
go

/* 
 * INDEX: [micRegMesRegIxFkMicReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('microRegioesMesoRegiao') AND name='micRegMesRegIxFkMicReg')
BEGIN
    DROP INDEX [microRegioesMesoRegiao].[micRegMesRegIxFkMicReg]
    PRINT '<<< DROPPED INDEX [microRegioesMesoRegiao].[micRegMesRegIxFkMicReg] >>>'
END
go

/* 
 * INDEX: [mesRegFkMicRegMesReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('microRegioesMesoRegiao') AND name='mesRegFkMicRegMesReg')
BEGIN
    DROP INDEX [microRegioesMesoRegiao].[mesRegFkMicRegMesReg]
    PRINT '<<< DROPPED INDEX [microRegioesMesoRegiao].[mesRegFkMicRegMesReg] >>>'
END
go

/* 
 * INDEX: [micRegFkMicRegMesReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('microRegioesMesoRegiao') AND name='micRegFkMicRegMesReg')
BEGIN
    DROP INDEX [microRegioesMesoRegiao].[micRegFkMicRegMesReg]
    PRINT '<<< DROPPED INDEX [microRegioesMesoRegiao].[micRegFkMicRegMesReg] >>>'
END
go

/* 
 * INDEX: [micRegMesRegIxAk] 
 */

CREATE UNIQUE INDEX [micRegMesRegIxAk] ON [microRegioesMesoRegiao]([mesRegID], [micRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('microRegioesMesoRegiao') AND name='micRegMesRegIxAk')
    PRINT '<<< CREATED INDEX microRegioesMesoRegiao.micRegMesRegIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX microRegioesMesoRegiao.micRegMesRegIxAk >>>'
go

/* 
 * INDEX: [micRegMesRegIxFkMesReg] 
 */

CREATE INDEX [micRegMesRegIxFkMesReg] ON [microRegioesMesoRegiao]([mesRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('microRegioesMesoRegiao') AND name='micRegMesRegIxFkMesReg')
    PRINT '<<< CREATED INDEX microRegioesMesoRegiao.micRegMesRegIxFkMesReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX microRegioesMesoRegiao.micRegMesRegIxFkMesReg >>>'
go

/* 
 * INDEX: [micRegMesRegIxFkMicReg] 
 */

CREATE INDEX [micRegMesRegIxFkMicReg] ON [microRegioesMesoRegiao]([micRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('microRegioesMesoRegiao') AND name='micRegMesRegIxFkMicReg')
    PRINT '<<< CREATED INDEX microRegioesMesoRegiao.micRegMesRegIxFkMicReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX microRegioesMesoRegiao.micRegMesRegIxFkMicReg >>>'
go

/* 
 * INDEX: [mesRegFkMicRegMesReg] 
 */

CREATE INDEX [mesRegFkMicRegMesReg] ON [microRegioesMesoRegiao]([mesRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('microRegioesMesoRegiao') AND name='mesRegFkMicRegMesReg')
    PRINT '<<< CREATED INDEX microRegioesMesoRegiao.mesRegFkMicRegMesReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX microRegioesMesoRegiao.mesRegFkMicRegMesReg >>>'
go

/* 
 * INDEX: [micRegFkMicRegMesReg] 
 */

CREATE INDEX [micRegFkMicRegMesReg] ON [microRegioesMesoRegiao]([micRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('microRegioesMesoRegiao') AND name='micRegFkMicRegMesReg')
    PRINT '<<< CREATED INDEX microRegioesMesoRegiao.micRegFkMicRegMesReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX microRegioesMesoRegiao.micRegFkMicRegMesReg >>>'
go

