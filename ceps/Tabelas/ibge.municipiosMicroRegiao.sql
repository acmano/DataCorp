IF OBJECT_ID('[ibge].[municipiosMicroRegiao]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[municipiosMicroRegiao]
    PRINT '<<< DROPPED TABLE [ibge].[municipiosMicroRegiao] >>>'
END
go
/* 
 * TABLE: [ibge].[municipiosMicroRegiao] 
 */

CREATE TABLE [ibge].[municipiosMicroRegiao](
    [munMicRegID]  int    IDENTITY(1,1),
    [micRegID]     int    NOT NULL,
    [munID]        int    NOT NULL
)
go



IF OBJECT_ID('ibge.municipiosMicroRegiao') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.municipiosMicroRegiao >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.municipiosMicroRegiao >>>'
go

/* 
 * TABLE: [ibge].[municipiosMicroRegiao] 
 */

ALTER TABLE [ibge].[municipiosMicroRegiao] ADD 
    CONSTRAINT [munMicRegIxPk] PRIMARY KEY CLUSTERED ([munMicRegID])
go

IF OBJECT_ID('ibge.municipiosMicroRegiao') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.municipiosMicroRegiao >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.municipiosMicroRegiao >>>'
go

/* 
 * INDEX: [munMicRegIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.municipiosMicroRegiao') AND name='munMicRegIxAk')
BEGIN
    DROP INDEX [ibge].[municipiosMicroRegiao].[munMicRegIxAk]
    PRINT '<<< DROPPED INDEX [ibge].[municipiosMicroRegiao].[munMicRegIxAk] >>>'
END
go

/* 
 * INDEX: [munMicRegIxFkMicReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.municipiosMicroRegiao') AND name='munMicRegIxFkMicReg')
BEGIN
    DROP INDEX [ibge].[municipiosMicroRegiao].[munMicRegIxFkMicReg]
    PRINT '<<< DROPPED INDEX [ibge].[municipiosMicroRegiao].[munMicRegIxFkMicReg] >>>'
END
go

/* 
 * INDEX: [munMicRegIxFkMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.municipiosMicroRegiao') AND name='munMicRegIxFkMun')
BEGIN
    DROP INDEX [ibge].[municipiosMicroRegiao].[munMicRegIxFkMun]
    PRINT '<<< DROPPED INDEX [ibge].[municipiosMicroRegiao].[munMicRegIxFkMun] >>>'
END
go

/* 
 * INDEX: [micRegFkMunMicReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.municipiosMicroRegiao') AND name='micRegFkMunMicReg')
BEGIN
    DROP INDEX [ibge].[municipiosMicroRegiao].[micRegFkMunMicReg]
    PRINT '<<< DROPPED INDEX [ibge].[municipiosMicroRegiao].[micRegFkMunMicReg] >>>'
END
go

/* 
 * INDEX: [munFkMunMicReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.municipiosMicroRegiao') AND name='munFkMunMicReg')
BEGIN
    DROP INDEX [ibge].[municipiosMicroRegiao].[munFkMunMicReg]
    PRINT '<<< DROPPED INDEX [ibge].[municipiosMicroRegiao].[munFkMunMicReg] >>>'
END
go

/* 
 * INDEX: [munMicRegIxAk] 
 */

CREATE UNIQUE INDEX [munMicRegIxAk] ON [ibge].[municipiosMicroRegiao]([micRegID], [munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.municipiosMicroRegiao') AND name='munMicRegIxAk')
    PRINT '<<< CREATED INDEX ibge.municipiosMicroRegiao.munMicRegIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.municipiosMicroRegiao.munMicRegIxAk >>>'
go

/* 
 * INDEX: [munMicRegIxFkMicReg] 
 */

CREATE INDEX [munMicRegIxFkMicReg] ON [ibge].[municipiosMicroRegiao]([micRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.municipiosMicroRegiao') AND name='munMicRegIxFkMicReg')
    PRINT '<<< CREATED INDEX ibge.municipiosMicroRegiao.munMicRegIxFkMicReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.municipiosMicroRegiao.munMicRegIxFkMicReg >>>'
go

/* 
 * INDEX: [munMicRegIxFkMun] 
 */

CREATE INDEX [munMicRegIxFkMun] ON [ibge].[municipiosMicroRegiao]([munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.municipiosMicroRegiao') AND name='munMicRegIxFkMun')
    PRINT '<<< CREATED INDEX ibge.municipiosMicroRegiao.munMicRegIxFkMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.municipiosMicroRegiao.munMicRegIxFkMun >>>'
go

/* 
 * INDEX: [micRegFkMunMicReg] 
 */

CREATE INDEX [micRegFkMunMicReg] ON [ibge].[municipiosMicroRegiao]([micRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.municipiosMicroRegiao') AND name='micRegFkMunMicReg')
    PRINT '<<< CREATED INDEX ibge.municipiosMicroRegiao.micRegFkMunMicReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.municipiosMicroRegiao.micRegFkMunMicReg >>>'
go

/* 
 * INDEX: [munFkMunMicReg] 
 */

CREATE INDEX [munFkMunMicReg] ON [ibge].[municipiosMicroRegiao]([munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.municipiosMicroRegiao') AND name='munFkMunMicReg')
    PRINT '<<< CREATED INDEX ibge.municipiosMicroRegiao.munFkMunMicReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.municipiosMicroRegiao.munFkMunMicReg >>>'
go

