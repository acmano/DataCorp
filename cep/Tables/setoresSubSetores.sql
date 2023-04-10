IF OBJECT_ID('[setoresSubSetores]') IS NOT NULL
BEGIN
    DROP TABLE [setoresSubSetores]
    PRINT '<<< DROPPED TABLE [setoresSubSetores] >>>'
END
go
/* 
 * TABLE: [setoresSubSetores] 
 */

CREATE TABLE [setoresSubSetores](
    [setSubSetID]  int    IDENTITY(1,1),
    [setID]        int    NOT NULL,
    [subSetID]     int    NOT NULL
)
go



IF OBJECT_ID('setoresSubSetores') IS NOT NULL
    PRINT '<<< CREATED TABLE setoresSubSetores >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE setoresSubSetores >>>'
go

/* 
 * TABLE: [setoresSubSetores] 
 */

ALTER TABLE [setoresSubSetores] ADD 
    CONSTRAINT [setSubSetIxPk] PRIMARY KEY CLUSTERED ([setSubSetID])
go

IF OBJECT_ID('setoresSubSetores') IS NOT NULL
    PRINT '<<< CREATED TABLE setoresSubSetores >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE setoresSubSetores >>>'
go

/* 
 * INDEX: [setSubSetIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('setoresSubSetores') AND name='setSubSetIxAk')
BEGIN
    DROP INDEX [setoresSubSetores].[setSubSetIxAk]
    PRINT '<<< DROPPED INDEX [setoresSubSetores].[setSubSetIxAk] >>>'
END
go

/* 
 * INDEX: [setSubSetIxFkSet] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('setoresSubSetores') AND name='setSubSetIxFkSet')
BEGIN
    DROP INDEX [setoresSubSetores].[setSubSetIxFkSet]
    PRINT '<<< DROPPED INDEX [setoresSubSetores].[setSubSetIxFkSet] >>>'
END
go

/* 
 * INDEX: [setSubSetIxSubSet] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('setoresSubSetores') AND name='setSubSetIxSubSet')
BEGIN
    DROP INDEX [setoresSubSetores].[setSubSetIxSubSet]
    PRINT '<<< DROPPED INDEX [setoresSubSetores].[setSubSetIxSubSet] >>>'
END
go

/* 
 * INDEX: [subSetSetFkSet] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('setoresSubSetores') AND name='subSetSetFkSet')
BEGIN
    DROP INDEX [setoresSubSetores].[subSetSetFkSet]
    PRINT '<<< DROPPED INDEX [setoresSubSetores].[subSetSetFkSet] >>>'
END
go

/* 
 * INDEX: [subSetSetFkSubSet] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('setoresSubSetores') AND name='subSetSetFkSubSet')
BEGIN
    DROP INDEX [setoresSubSetores].[subSetSetFkSubSet]
    PRINT '<<< DROPPED INDEX [setoresSubSetores].[subSetSetFkSubSet] >>>'
END
go

/* 
 * INDEX: [setSubSetIxAk] 
 */

CREATE UNIQUE INDEX [setSubSetIxAk] ON [setoresSubSetores]([setID], [subSetID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('setoresSubSetores') AND name='setSubSetIxAk')
    PRINT '<<< CREATED INDEX setoresSubSetores.setSubSetIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX setoresSubSetores.setSubSetIxAk >>>'
go

/* 
 * INDEX: [setSubSetIxFkSet] 
 */

CREATE INDEX [setSubSetIxFkSet] ON [setoresSubSetores]([setID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('setoresSubSetores') AND name='setSubSetIxFkSet')
    PRINT '<<< CREATED INDEX setoresSubSetores.setSubSetIxFkSet >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX setoresSubSetores.setSubSetIxFkSet >>>'
go

/* 
 * INDEX: [setSubSetIxSubSet] 
 */

CREATE INDEX [setSubSetIxSubSet] ON [setoresSubSetores]([subSetID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('setoresSubSetores') AND name='setSubSetIxSubSet')
    PRINT '<<< CREATED INDEX setoresSubSetores.setSubSetIxSubSet >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX setoresSubSetores.setSubSetIxSubSet >>>'
go

/* 
 * INDEX: [subSetSetFkSet] 
 */

CREATE INDEX [subSetSetFkSet] ON [setoresSubSetores]([setID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('setoresSubSetores') AND name='subSetSetFkSet')
    PRINT '<<< CREATED INDEX setoresSubSetores.subSetSetFkSet >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX setoresSubSetores.subSetSetFkSet >>>'
go

/* 
 * INDEX: [subSetSetFkSubSet] 
 */

CREATE INDEX [subSetSetFkSubSet] ON [setoresSubSetores]([subSetID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('setoresSubSetores') AND name='subSetSetFkSubSet')
    PRINT '<<< CREATED INDEX setoresSubSetores.subSetSetFkSubSet >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX setoresSubSetores.subSetSetFkSubSet >>>'
go

