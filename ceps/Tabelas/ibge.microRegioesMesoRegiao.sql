IF OBJECT_ID('[ibge].[microRegioesMesoRegiao]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[microRegioesMesoRegiao]
    PRINT '<<< DROPPED TABLE [ibge].[microRegioesMesoRegiao] >>>'
END
go
/* 
 * TABLE: [ibge].[microRegioesMesoRegiao] 
 */

CREATE TABLE [ibge].[microRegioesMesoRegiao](
    [micRegMesRegID]  int    IDENTITY(1,1),
    [mesRegID]        int    NOT NULL,
    [micRegID]        int    NOT NULL
)
go



IF OBJECT_ID('ibge.microRegioesMesoRegiao') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.microRegioesMesoRegiao >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.microRegioesMesoRegiao >>>'
go

/* 
 * TABLE: [ibge].[microRegioesMesoRegiao] 
 */

ALTER TABLE [ibge].[microRegioesMesoRegiao] ADD 
    CONSTRAINT [micRegMesRegIxPk] PRIMARY KEY CLUSTERED ([micRegMesRegID])
go

IF OBJECT_ID('ibge.microRegioesMesoRegiao') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.microRegioesMesoRegiao >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.microRegioesMesoRegiao >>>'
go

/* 
 * INDEX: [micRegMesRegIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.microRegioesMesoRegiao') AND name='micRegMesRegIxAk')
BEGIN
    DROP INDEX [ibge].[microRegioesMesoRegiao].[micRegMesRegIxAk]
    PRINT '<<< DROPPED INDEX [ibge].[microRegioesMesoRegiao].[micRegMesRegIxAk] >>>'
END
go

/* 
 * INDEX: [micRegMesRegIxFkMesReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.microRegioesMesoRegiao') AND name='micRegMesRegIxFkMesReg')
BEGIN
    DROP INDEX [ibge].[microRegioesMesoRegiao].[micRegMesRegIxFkMesReg]
    PRINT '<<< DROPPED INDEX [ibge].[microRegioesMesoRegiao].[micRegMesRegIxFkMesReg] >>>'
END
go

/* 
 * INDEX: [micRegMesRegIxFkMicReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.microRegioesMesoRegiao') AND name='micRegMesRegIxFkMicReg')
BEGIN
    DROP INDEX [ibge].[microRegioesMesoRegiao].[micRegMesRegIxFkMicReg]
    PRINT '<<< DROPPED INDEX [ibge].[microRegioesMesoRegiao].[micRegMesRegIxFkMicReg] >>>'
END
go

/* 
 * INDEX: [mesRegFkMicRegMesReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.microRegioesMesoRegiao') AND name='mesRegFkMicRegMesReg')
BEGIN
    DROP INDEX [ibge].[microRegioesMesoRegiao].[mesRegFkMicRegMesReg]
    PRINT '<<< DROPPED INDEX [ibge].[microRegioesMesoRegiao].[mesRegFkMicRegMesReg] >>>'
END
go

/* 
 * INDEX: [micRegFkMicRegMesReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.microRegioesMesoRegiao') AND name='micRegFkMicRegMesReg')
BEGIN
    DROP INDEX [ibge].[microRegioesMesoRegiao].[micRegFkMicRegMesReg]
    PRINT '<<< DROPPED INDEX [ibge].[microRegioesMesoRegiao].[micRegFkMicRegMesReg] >>>'
END
go

/* 
 * INDEX: [micRegMesRegIxAk] 
 */

CREATE UNIQUE INDEX [micRegMesRegIxAk] ON [ibge].[microRegioesMesoRegiao]([mesRegID], [micRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.microRegioesMesoRegiao') AND name='micRegMesRegIxAk')
    PRINT '<<< CREATED INDEX ibge.microRegioesMesoRegiao.micRegMesRegIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.microRegioesMesoRegiao.micRegMesRegIxAk >>>'
go

/* 
 * INDEX: [micRegMesRegIxFkMesReg] 
 */

CREATE INDEX [micRegMesRegIxFkMesReg] ON [ibge].[microRegioesMesoRegiao]([mesRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.microRegioesMesoRegiao') AND name='micRegMesRegIxFkMesReg')
    PRINT '<<< CREATED INDEX ibge.microRegioesMesoRegiao.micRegMesRegIxFkMesReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.microRegioesMesoRegiao.micRegMesRegIxFkMesReg >>>'
go

/* 
 * INDEX: [micRegMesRegIxFkMicReg] 
 */

CREATE INDEX [micRegMesRegIxFkMicReg] ON [ibge].[microRegioesMesoRegiao]([micRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.microRegioesMesoRegiao') AND name='micRegMesRegIxFkMicReg')
    PRINT '<<< CREATED INDEX ibge.microRegioesMesoRegiao.micRegMesRegIxFkMicReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.microRegioesMesoRegiao.micRegMesRegIxFkMicReg >>>'
go

/* 
 * INDEX: [mesRegFkMicRegMesReg] 
 */

CREATE INDEX [mesRegFkMicRegMesReg] ON [ibge].[microRegioesMesoRegiao]([mesRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.microRegioesMesoRegiao') AND name='mesRegFkMicRegMesReg')
    PRINT '<<< CREATED INDEX ibge.microRegioesMesoRegiao.mesRegFkMicRegMesReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.microRegioesMesoRegiao.mesRegFkMicRegMesReg >>>'
go

/* 
 * INDEX: [micRegFkMicRegMesReg] 
 */

CREATE INDEX [micRegFkMicRegMesReg] ON [ibge].[microRegioesMesoRegiao]([micRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.microRegioesMesoRegiao') AND name='micRegFkMicRegMesReg')
    PRINT '<<< CREATED INDEX ibge.microRegioesMesoRegiao.micRegFkMicRegMesReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.microRegioesMesoRegiao.micRegFkMicRegMesReg >>>'
go

