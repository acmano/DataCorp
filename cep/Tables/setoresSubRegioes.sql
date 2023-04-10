IF OBJECT_ID('[setoresSubRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [setoresSubRegioes]
    PRINT '<<< DROPPED TABLE [setoresSubRegioes] >>>'
END
go
/* 
 * TABLE: [setoresSubRegioes] 
 */

CREATE TABLE [setoresSubRegioes](
    [setSubRegID]  int    IDENTITY(1,1),
    [subRegID]     int    NOT NULL,
    [setID]        int    NOT NULL
)
go



IF OBJECT_ID('setoresSubRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE setoresSubRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE setoresSubRegioes >>>'
go

/* 
 * TABLE: [setoresSubRegioes] 
 */

ALTER TABLE [setoresSubRegioes] ADD 
    CONSTRAINT [setSubRegIxPk] PRIMARY KEY CLUSTERED ([setSubRegID])
go

IF OBJECT_ID('setoresSubRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE setoresSubRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE setoresSubRegioes >>>'
go

/* 
 * INDEX: [setSubRegIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('setoresSubRegioes') AND name='setSubRegIxAk')
BEGIN
    DROP INDEX [setoresSubRegioes].[setSubRegIxAk]
    PRINT '<<< DROPPED INDEX [setoresSubRegioes].[setSubRegIxAk] >>>'
END
go

/* 
 * INDEX: [setSubRegIxFkSet] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('setoresSubRegioes') AND name='setSubRegIxFkSet')
BEGIN
    DROP INDEX [setoresSubRegioes].[setSubRegIxFkSet]
    PRINT '<<< DROPPED INDEX [setoresSubRegioes].[setSubRegIxFkSet] >>>'
END
go

/* 
 * INDEX: [setSubRegIxFkSubSet] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('setoresSubRegioes') AND name='setSubRegIxFkSubSet')
BEGIN
    DROP INDEX [setoresSubRegioes].[setSubRegIxFkSubSet]
    PRINT '<<< DROPPED INDEX [setoresSubRegioes].[setSubRegIxFkSubSet] >>>'
END
go

/* 
 * INDEX: [setSubRegFkSubReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('setoresSubRegioes') AND name='setSubRegFkSubReg')
BEGIN
    DROP INDEX [setoresSubRegioes].[setSubRegFkSubReg]
    PRINT '<<< DROPPED INDEX [setoresSubRegioes].[setSubRegFkSubReg] >>>'
END
go

/* 
 * INDEX: [setSubRegFkSet] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('setoresSubRegioes') AND name='setSubRegFkSet')
BEGIN
    DROP INDEX [setoresSubRegioes].[setSubRegFkSet]
    PRINT '<<< DROPPED INDEX [setoresSubRegioes].[setSubRegFkSet] >>>'
END
go

/* 
 * INDEX: [setSubRegIxAk] 
 */

CREATE UNIQUE INDEX [setSubRegIxAk] ON [setoresSubRegioes]([setID], [subRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('setoresSubRegioes') AND name='setSubRegIxAk')
    PRINT '<<< CREATED INDEX setoresSubRegioes.setSubRegIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX setoresSubRegioes.setSubRegIxAk >>>'
go

/* 
 * INDEX: [setSubRegIxFkSet] 
 */

CREATE INDEX [setSubRegIxFkSet] ON [setoresSubRegioes]([setID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('setoresSubRegioes') AND name='setSubRegIxFkSet')
    PRINT '<<< CREATED INDEX setoresSubRegioes.setSubRegIxFkSet >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX setoresSubRegioes.setSubRegIxFkSet >>>'
go

/* 
 * INDEX: [setSubRegIxFkSubSet] 
 */

CREATE INDEX [setSubRegIxFkSubSet] ON [setoresSubRegioes]([subRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('setoresSubRegioes') AND name='setSubRegIxFkSubSet')
    PRINT '<<< CREATED INDEX setoresSubRegioes.setSubRegIxFkSubSet >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX setoresSubRegioes.setSubRegIxFkSubSet >>>'
go

/* 
 * INDEX: [setSubRegFkSubReg] 
 */

CREATE INDEX [setSubRegFkSubReg] ON [setoresSubRegioes]([subRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('setoresSubRegioes') AND name='setSubRegFkSubReg')
    PRINT '<<< CREATED INDEX setoresSubRegioes.setSubRegFkSubReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX setoresSubRegioes.setSubRegFkSubReg >>>'
go

/* 
 * INDEX: [setSubRegFkSet] 
 */

CREATE INDEX [setSubRegFkSet] ON [setoresSubRegioes]([setID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('setoresSubRegioes') AND name='setSubRegFkSet')
    PRINT '<<< CREATED INDEX setoresSubRegioes.setSubRegFkSet >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX setoresSubRegioes.setSubRegFkSet >>>'
go

