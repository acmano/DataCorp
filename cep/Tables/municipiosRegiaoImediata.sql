IF OBJECT_ID('[municipiosRegiaoImediata]') IS NOT NULL
BEGIN
    DROP TABLE [municipiosRegiaoImediata]
    PRINT '<<< DROPPED TABLE [municipiosRegiaoImediata] >>>'
END
go
/* 
 * TABLE: [municipiosRegiaoImediata] 
 */

CREATE TABLE [municipiosRegiaoImediata](
    [munRegImeID]  int    IDENTITY(1,1),
    [regImeID]     int    NOT NULL,
    [munID]        int    NOT NULL
)
go



IF OBJECT_ID('municipiosRegiaoImediata') IS NOT NULL
    PRINT '<<< CREATED TABLE municipiosRegiaoImediata >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE municipiosRegiaoImediata >>>'
go

/* 
 * TABLE: [municipiosRegiaoImediata] 
 */

ALTER TABLE [municipiosRegiaoImediata] ADD 
    CONSTRAINT [munRegImeIxPk] PRIMARY KEY CLUSTERED ([munRegImeID])
go

IF OBJECT_ID('municipiosRegiaoImediata') IS NOT NULL
    PRINT '<<< CREATED TABLE municipiosRegiaoImediata >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE municipiosRegiaoImediata >>>'
go

/* 
 * INDEX: [munRegImeIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('municipiosRegiaoImediata') AND name='munRegImeIxAk')
BEGIN
    DROP INDEX [municipiosRegiaoImediata].[munRegImeIxAk]
    PRINT '<<< DROPPED INDEX [municipiosRegiaoImediata].[munRegImeIxAk] >>>'
END
go

/* 
 * INDEX: [munRegImeIxFkRegIme] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('municipiosRegiaoImediata') AND name='munRegImeIxFkRegIme')
BEGIN
    DROP INDEX [municipiosRegiaoImediata].[munRegImeIxFkRegIme]
    PRINT '<<< DROPPED INDEX [municipiosRegiaoImediata].[munRegImeIxFkRegIme] >>>'
END
go

/* 
 * INDEX: [munRegImeIxFkMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('municipiosRegiaoImediata') AND name='munRegImeIxFkMun')
BEGIN
    DROP INDEX [municipiosRegiaoImediata].[munRegImeIxFkMun]
    PRINT '<<< DROPPED INDEX [municipiosRegiaoImediata].[munRegImeIxFkMun] >>>'
END
go

/* 
 * INDEX: [regImeFkMunRegIme] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('municipiosRegiaoImediata') AND name='regImeFkMunRegIme')
BEGIN
    DROP INDEX [municipiosRegiaoImediata].[regImeFkMunRegIme]
    PRINT '<<< DROPPED INDEX [municipiosRegiaoImediata].[regImeFkMunRegIme] >>>'
END
go

/* 
 * INDEX: [munFkMunRegIme] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('municipiosRegiaoImediata') AND name='munFkMunRegIme')
BEGIN
    DROP INDEX [municipiosRegiaoImediata].[munFkMunRegIme]
    PRINT '<<< DROPPED INDEX [municipiosRegiaoImediata].[munFkMunRegIme] >>>'
END
go

/* 
 * INDEX: [munRegImeIxAk] 
 */

CREATE INDEX [munRegImeIxAk] ON [municipiosRegiaoImediata]([regImeID], [munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('municipiosRegiaoImediata') AND name='munRegImeIxAk')
    PRINT '<<< CREATED INDEX municipiosRegiaoImediata.munRegImeIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX municipiosRegiaoImediata.munRegImeIxAk >>>'
go

/* 
 * INDEX: [munRegImeIxFkRegIme] 
 */

CREATE INDEX [munRegImeIxFkRegIme] ON [municipiosRegiaoImediata]([regImeID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('municipiosRegiaoImediata') AND name='munRegImeIxFkRegIme')
    PRINT '<<< CREATED INDEX municipiosRegiaoImediata.munRegImeIxFkRegIme >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX municipiosRegiaoImediata.munRegImeIxFkRegIme >>>'
go

/* 
 * INDEX: [munRegImeIxFkMun] 
 */

CREATE INDEX [munRegImeIxFkMun] ON [municipiosRegiaoImediata]([munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('municipiosRegiaoImediata') AND name='munRegImeIxFkMun')
    PRINT '<<< CREATED INDEX municipiosRegiaoImediata.munRegImeIxFkMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX municipiosRegiaoImediata.munRegImeIxFkMun >>>'
go

/* 
 * INDEX: [regImeFkMunRegIme] 
 */

CREATE INDEX [regImeFkMunRegIme] ON [municipiosRegiaoImediata]([regImeID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('municipiosRegiaoImediata') AND name='regImeFkMunRegIme')
    PRINT '<<< CREATED INDEX municipiosRegiaoImediata.regImeFkMunRegIme >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX municipiosRegiaoImediata.regImeFkMunRegIme >>>'
go

/* 
 * INDEX: [munFkMunRegIme] 
 */

CREATE INDEX [munFkMunRegIme] ON [municipiosRegiaoImediata]([munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('municipiosRegiaoImediata') AND name='munFkMunRegIme')
    PRINT '<<< CREATED INDEX municipiosRegiaoImediata.munFkMunRegIme >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX municipiosRegiaoImediata.munFkMunRegIme >>>'
go

