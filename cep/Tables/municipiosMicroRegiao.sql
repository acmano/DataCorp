IF OBJECT_ID('[municipiosMicroRegiao]') IS NOT NULL
BEGIN
    DROP TABLE [municipiosMicroRegiao]
    PRINT '<<< DROPPED TABLE [municipiosMicroRegiao] >>>'
END
go
/* 
 * TABLE: [municipiosMicroRegiao] 
 */

CREATE TABLE [municipiosMicroRegiao](
    [munMicRegID]  int    IDENTITY(1,1),
    [micRegID]     int    NOT NULL,
    [munID]        int    NOT NULL
)
go



IF OBJECT_ID('municipiosMicroRegiao') IS NOT NULL
    PRINT '<<< CREATED TABLE municipiosMicroRegiao >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE municipiosMicroRegiao >>>'
go

/* 
 * TABLE: [municipiosMicroRegiao] 
 */

ALTER TABLE [municipiosMicroRegiao] ADD 
    CONSTRAINT [munMicRegIxPk] PRIMARY KEY CLUSTERED ([munMicRegID])
go

IF OBJECT_ID('municipiosMicroRegiao') IS NOT NULL
    PRINT '<<< CREATED TABLE municipiosMicroRegiao >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE municipiosMicroRegiao >>>'
go

/* 
 * INDEX: [munMicRegIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('municipiosMicroRegiao') AND name='munMicRegIxAk')
BEGIN
    DROP INDEX [municipiosMicroRegiao].[munMicRegIxAk]
    PRINT '<<< DROPPED INDEX [municipiosMicroRegiao].[munMicRegIxAk] >>>'
END
go

/* 
 * INDEX: [munMicRegIxFkMicReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('municipiosMicroRegiao') AND name='munMicRegIxFkMicReg')
BEGIN
    DROP INDEX [municipiosMicroRegiao].[munMicRegIxFkMicReg]
    PRINT '<<< DROPPED INDEX [municipiosMicroRegiao].[munMicRegIxFkMicReg] >>>'
END
go

/* 
 * INDEX: [munMicRegIxFkMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('municipiosMicroRegiao') AND name='munMicRegIxFkMun')
BEGIN
    DROP INDEX [municipiosMicroRegiao].[munMicRegIxFkMun]
    PRINT '<<< DROPPED INDEX [municipiosMicroRegiao].[munMicRegIxFkMun] >>>'
END
go

/* 
 * INDEX: [micRegFkMunMicReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('municipiosMicroRegiao') AND name='micRegFkMunMicReg')
BEGIN
    DROP INDEX [municipiosMicroRegiao].[micRegFkMunMicReg]
    PRINT '<<< DROPPED INDEX [municipiosMicroRegiao].[micRegFkMunMicReg] >>>'
END
go

/* 
 * INDEX: [munFkMunMicReg] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('municipiosMicroRegiao') AND name='munFkMunMicReg')
BEGIN
    DROP INDEX [municipiosMicroRegiao].[munFkMunMicReg]
    PRINT '<<< DROPPED INDEX [municipiosMicroRegiao].[munFkMunMicReg] >>>'
END
go

/* 
 * INDEX: [munMicRegIxAk] 
 */

CREATE UNIQUE INDEX [munMicRegIxAk] ON [municipiosMicroRegiao]([micRegID], [munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('municipiosMicroRegiao') AND name='munMicRegIxAk')
    PRINT '<<< CREATED INDEX municipiosMicroRegiao.munMicRegIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX municipiosMicroRegiao.munMicRegIxAk >>>'
go

/* 
 * INDEX: [munMicRegIxFkMicReg] 
 */

CREATE INDEX [munMicRegIxFkMicReg] ON [municipiosMicroRegiao]([micRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('municipiosMicroRegiao') AND name='munMicRegIxFkMicReg')
    PRINT '<<< CREATED INDEX municipiosMicroRegiao.munMicRegIxFkMicReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX municipiosMicroRegiao.munMicRegIxFkMicReg >>>'
go

/* 
 * INDEX: [munMicRegIxFkMun] 
 */

CREATE INDEX [munMicRegIxFkMun] ON [municipiosMicroRegiao]([munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('municipiosMicroRegiao') AND name='munMicRegIxFkMun')
    PRINT '<<< CREATED INDEX municipiosMicroRegiao.munMicRegIxFkMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX municipiosMicroRegiao.munMicRegIxFkMun >>>'
go

/* 
 * INDEX: [micRegFkMunMicReg] 
 */

CREATE INDEX [micRegFkMunMicReg] ON [municipiosMicroRegiao]([micRegID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('municipiosMicroRegiao') AND name='micRegFkMunMicReg')
    PRINT '<<< CREATED INDEX municipiosMicroRegiao.micRegFkMunMicReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX municipiosMicroRegiao.micRegFkMunMicReg >>>'
go

/* 
 * INDEX: [munFkMunMicReg] 
 */

CREATE INDEX [munFkMunMicReg] ON [municipiosMicroRegiao]([munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('municipiosMicroRegiao') AND name='munFkMunMicReg')
    PRINT '<<< CREATED INDEX municipiosMicroRegiao.munFkMunMicReg >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX municipiosMicroRegiao.munFkMunMicReg >>>'
go

