IF OBJECT_ID('[ibge].[municipiosRegiaoImediata]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[municipiosRegiaoImediata]
    PRINT '<<< DROPPED TABLE [ibge].[municipiosRegiaoImediata] >>>'
END
go
/* 
 * TABLE: [ibge].[municipiosRegiaoImediata] 
 */

CREATE TABLE [ibge].[municipiosRegiaoImediata](
    [munRegImeID]  int    IDENTITY(1,1),
    [regImeID]     int    NOT NULL,
    [munID]        int    NOT NULL
)
go



IF OBJECT_ID('ibge.municipiosRegiaoImediata') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.municipiosRegiaoImediata >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.municipiosRegiaoImediata >>>'
go

/* 
 * TABLE: [ibge].[municipiosRegiaoImediata] 
 */

ALTER TABLE [ibge].[municipiosRegiaoImediata] ADD 
    CONSTRAINT [munRegImeIxPk] PRIMARY KEY CLUSTERED ([munRegImeID])
go

IF OBJECT_ID('ibge.municipiosRegiaoImediata') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.municipiosRegiaoImediata >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.municipiosRegiaoImediata >>>'
go

/* 
 * INDEX: [munRegImeIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.municipiosRegiaoImediata') AND name='munRegImeIxAk')
BEGIN
    DROP INDEX [ibge].[municipiosRegiaoImediata].[munRegImeIxAk]
    PRINT '<<< DROPPED INDEX [ibge].[municipiosRegiaoImediata].[munRegImeIxAk] >>>'
END
go

/* 
 * INDEX: [munRegImeIxFkRegIme] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.municipiosRegiaoImediata') AND name='munRegImeIxFkRegIme')
BEGIN
    DROP INDEX [ibge].[municipiosRegiaoImediata].[munRegImeIxFkRegIme]
    PRINT '<<< DROPPED INDEX [ibge].[municipiosRegiaoImediata].[munRegImeIxFkRegIme] >>>'
END
go

/* 
 * INDEX: [munRegImeIxFkMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.municipiosRegiaoImediata') AND name='munRegImeIxFkMun')
BEGIN
    DROP INDEX [ibge].[municipiosRegiaoImediata].[munRegImeIxFkMun]
    PRINT '<<< DROPPED INDEX [ibge].[municipiosRegiaoImediata].[munRegImeIxFkMun] >>>'
END
go

/* 
 * INDEX: [regImeFkMunRegIme] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.municipiosRegiaoImediata') AND name='regImeFkMunRegIme')
BEGIN
    DROP INDEX [ibge].[municipiosRegiaoImediata].[regImeFkMunRegIme]
    PRINT '<<< DROPPED INDEX [ibge].[municipiosRegiaoImediata].[regImeFkMunRegIme] >>>'
END
go

/* 
 * INDEX: [munFkMunRegIme] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.municipiosRegiaoImediata') AND name='munFkMunRegIme')
BEGIN
    DROP INDEX [ibge].[municipiosRegiaoImediata].[munFkMunRegIme]
    PRINT '<<< DROPPED INDEX [ibge].[municipiosRegiaoImediata].[munFkMunRegIme] >>>'
END
go

/* 
 * INDEX: [munRegImeIxAk] 
 */

CREATE INDEX [munRegImeIxAk] ON [ibge].[municipiosRegiaoImediata]([regImeID], [munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.municipiosRegiaoImediata') AND name='munRegImeIxAk')
    PRINT '<<< CREATED INDEX ibge.municipiosRegiaoImediata.munRegImeIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.municipiosRegiaoImediata.munRegImeIxAk >>>'
go

/* 
 * INDEX: [munRegImeIxFkRegIme] 
 */

CREATE INDEX [munRegImeIxFkRegIme] ON [ibge].[municipiosRegiaoImediata]([regImeID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.municipiosRegiaoImediata') AND name='munRegImeIxFkRegIme')
    PRINT '<<< CREATED INDEX ibge.municipiosRegiaoImediata.munRegImeIxFkRegIme >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.municipiosRegiaoImediata.munRegImeIxFkRegIme >>>'
go

/* 
 * INDEX: [munRegImeIxFkMun] 
 */

CREATE INDEX [munRegImeIxFkMun] ON [ibge].[municipiosRegiaoImediata]([munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.municipiosRegiaoImediata') AND name='munRegImeIxFkMun')
    PRINT '<<< CREATED INDEX ibge.municipiosRegiaoImediata.munRegImeIxFkMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.municipiosRegiaoImediata.munRegImeIxFkMun >>>'
go

/* 
 * INDEX: [regImeFkMunRegIme] 
 */

CREATE INDEX [regImeFkMunRegIme] ON [ibge].[municipiosRegiaoImediata]([regImeID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.municipiosRegiaoImediata') AND name='regImeFkMunRegIme')
    PRINT '<<< CREATED INDEX ibge.municipiosRegiaoImediata.regImeFkMunRegIme >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.municipiosRegiaoImediata.regImeFkMunRegIme >>>'
go

/* 
 * INDEX: [munFkMunRegIme] 
 */

CREATE INDEX [munFkMunRegIme] ON [ibge].[municipiosRegiaoImediata]([munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.municipiosRegiaoImediata') AND name='munFkMunRegIme')
    PRINT '<<< CREATED INDEX ibge.municipiosRegiaoImediata.munFkMunRegIme >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.municipiosRegiaoImediata.munFkMunRegIme >>>'
go

