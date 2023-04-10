IF OBJECT_ID('[cep].[setoresSubSetores]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[setoresSubSetores]
    PRINT '<<< DROPPED TABLE [cep].[setoresSubSetores] >>>'
END
go
/* 
 * TABLE: [cep].[setoresSubSetores] 
 */

CREATE TABLE [cep].[setoresSubSetores](
    [setSubSetID]  int    IDENTITY(1,1),
    [setID]        int    NOT NULL,
    [subSetID]     int    NOT NULL
)
go



IF OBJECT_ID('cep.setoresSubSetores') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.setoresSubSetores >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.setoresSubSetores >>>'
go

/* 
 * TABLE: [cep].[setoresSubSetores] 
 */

ALTER TABLE [cep].[setoresSubSetores] ADD 
    CONSTRAINT [setSubSetIxPk] PRIMARY KEY CLUSTERED ([setSubSetID])
go

IF OBJECT_ID('cep.setoresSubSetores') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.setoresSubSetores >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.setoresSubSetores >>>'
go

/* 
 * INDEX: [setSubSetIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.setoresSubSetores') AND name='setSubSetIxAk')
BEGIN
    DROP INDEX [cep].[setoresSubSetores].[setSubSetIxAk]
    PRINT '<<< DROPPED INDEX [cep].[setoresSubSetores].[setSubSetIxAk] >>>'
END
go

/* 
 * INDEX: [setSubSetIxFkSet] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.setoresSubSetores') AND name='setSubSetIxFkSet')
BEGIN
    DROP INDEX [cep].[setoresSubSetores].[setSubSetIxFkSet]
    PRINT '<<< DROPPED INDEX [cep].[setoresSubSetores].[setSubSetIxFkSet] >>>'
END
go

/* 
 * INDEX: [setSubSetIxSubSet] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.setoresSubSetores') AND name='setSubSetIxSubSet')
BEGIN
    DROP INDEX [cep].[setoresSubSetores].[setSubSetIxSubSet]
    PRINT '<<< DROPPED INDEX [cep].[setoresSubSetores].[setSubSetIxSubSet] >>>'
END
go

/* 
 * INDEX: [subSetSetFkSet] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.setoresSubSetores') AND name='subSetSetFkSet')
BEGIN
    DROP INDEX [cep].[setoresSubSetores].[subSetSetFkSet]
    PRINT '<<< DROPPED INDEX [cep].[setoresSubSetores].[subSetSetFkSet] >>>'
END
go

/* 
 * INDEX: [subSetSetFkSubSet] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.setoresSubSetores') AND name='subSetSetFkSubSet')
BEGIN
    DROP INDEX [cep].[setoresSubSetores].[subSetSetFkSubSet]
    PRINT '<<< DROPPED INDEX [cep].[setoresSubSetores].[subSetSetFkSubSet] >>>'
END
go

/* 
 * INDEX: [setSubSetIxAk] 
 */

CREATE UNIQUE INDEX [setSubSetIxAk] ON [cep].[setoresSubSetores]([setID], [subSetID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.setoresSubSetores') AND name='setSubSetIxAk')
    PRINT '<<< CREATED INDEX cep.setoresSubSetores.setSubSetIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.setoresSubSetores.setSubSetIxAk >>>'
go

/* 
 * INDEX: [setSubSetIxFkSet] 
 */

CREATE INDEX [setSubSetIxFkSet] ON [cep].[setoresSubSetores]([setID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.setoresSubSetores') AND name='setSubSetIxFkSet')
    PRINT '<<< CREATED INDEX cep.setoresSubSetores.setSubSetIxFkSet >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.setoresSubSetores.setSubSetIxFkSet >>>'
go

/* 
 * INDEX: [setSubSetIxSubSet] 
 */

CREATE INDEX [setSubSetIxSubSet] ON [cep].[setoresSubSetores]([subSetID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.setoresSubSetores') AND name='setSubSetIxSubSet')
    PRINT '<<< CREATED INDEX cep.setoresSubSetores.setSubSetIxSubSet >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.setoresSubSetores.setSubSetIxSubSet >>>'
go

/* 
 * INDEX: [subSetSetFkSet] 
 */

CREATE INDEX [subSetSetFkSet] ON [cep].[setoresSubSetores]([setID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.setoresSubSetores') AND name='subSetSetFkSet')
    PRINT '<<< CREATED INDEX cep.setoresSubSetores.subSetSetFkSet >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.setoresSubSetores.subSetSetFkSet >>>'
go

/* 
 * INDEX: [subSetSetFkSubSet] 
 */

CREATE INDEX [subSetSetFkSubSet] ON [cep].[setoresSubSetores]([subSetID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.setoresSubSetores') AND name='subSetSetFkSubSet')
    PRINT '<<< CREATED INDEX cep.setoresSubSetores.subSetSetFkSubSet >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.setoresSubSetores.subSetSetFkSubSet >>>'
go

