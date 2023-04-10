IF OBJECT_ID('[geo].[continentesMundos]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[continentesMundos]
    PRINT '<<< DROPPED TABLE [geo].[continentesMundos] >>>'
END
go
/* 
 * TABLE: [geo].[continentesMundos] 
 */

CREATE TABLE [geo].[continentesMundos](
    [ctnMunID]  int    IDENTITY(1,1),
    [munID]     int    NOT NULL,
    [ctnID]     int    NOT NULL
)
go



IF OBJECT_ID('geo.continentesMundos') IS NOT NULL
    PRINT '<<< CREATED TABLE geo.continentesMundos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE geo.continentesMundos >>>'
go

/* 
 * TABLE: [geo].[continentesMundos] 
 */

ALTER TABLE [geo].[continentesMundos] ADD 
    CONSTRAINT [ctnMunIxPk] PRIMARY KEY CLUSTERED ([ctnMunID])
go

IF OBJECT_ID('geo.continentesMundos') IS NOT NULL
    PRINT '<<< CREATED TABLE geo.continentesMundos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE geo.continentesMundos >>>'
go

/* 
 * INDEX: [ctnMunIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.continentesMundos') AND name='ctnMunIxAk')
BEGIN
    DROP INDEX [geo].[continentesMundos].[ctnMunIxAk]
    PRINT '<<< DROPPED INDEX [geo].[continentesMundos].[ctnMunIxAk] >>>'
END
go

/* 
 * INDEX: [ctnMunIxFkMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.continentesMundos') AND name='ctnMunIxFkMun')
BEGIN
    DROP INDEX [geo].[continentesMundos].[ctnMunIxFkMun]
    PRINT '<<< DROPPED INDEX [geo].[continentesMundos].[ctnMunIxFkMun] >>>'
END
go

/* 
 * INDEX: [munFkCtnMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.continentesMundos') AND name='munFkCtnMun')
BEGIN
    DROP INDEX [geo].[continentesMundos].[munFkCtnMun]
    PRINT '<<< DROPPED INDEX [geo].[continentesMundos].[munFkCtnMun] >>>'
END
go

/* 
 * INDEX: [ctnFkCtnMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.continentesMundos') AND name='ctnFkCtnMun')
BEGIN
    DROP INDEX [geo].[continentesMundos].[ctnFkCtnMun]
    PRINT '<<< DROPPED INDEX [geo].[continentesMundos].[ctnFkCtnMun] >>>'
END
go

/* 
 * INDEX: [ctnMunIxAk] 
 */

CREATE UNIQUE INDEX [ctnMunIxAk] ON [geo].[continentesMundos]([ctnID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.continentesMundos') AND name='ctnMunIxAk')
    PRINT '<<< CREATED INDEX geo.continentesMundos.ctnMunIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.continentesMundos.ctnMunIxAk >>>'
go

/* 
 * INDEX: [ctnMunIxFkMun] 
 */

CREATE INDEX [ctnMunIxFkMun] ON [geo].[continentesMundos]([munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.continentesMundos') AND name='ctnMunIxFkMun')
    PRINT '<<< CREATED INDEX geo.continentesMundos.ctnMunIxFkMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.continentesMundos.ctnMunIxFkMun >>>'
go

/* 
 * INDEX: [munFkCtnMun] 
 */

CREATE INDEX [munFkCtnMun] ON [geo].[continentesMundos]([munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.continentesMundos') AND name='munFkCtnMun')
    PRINT '<<< CREATED INDEX geo.continentesMundos.munFkCtnMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.continentesMundos.munFkCtnMun >>>'
go

/* 
 * INDEX: [ctnFkCtnMun] 
 */

CREATE INDEX [ctnFkCtnMun] ON [geo].[continentesMundos]([ctnID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.continentesMundos') AND name='ctnFkCtnMun')
    PRINT '<<< CREATED INDEX geo.continentesMundos.ctnFkCtnMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.continentesMundos.ctnFkCtnMun >>>'
go

