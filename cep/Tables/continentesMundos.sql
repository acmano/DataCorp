IF OBJECT_ID('[continentesMundos]') IS NOT NULL
BEGIN
    DROP TABLE [continentesMundos]
    PRINT '<<< DROPPED TABLE [continentesMundos] >>>'
END
go
/* 
 * TABLE: [continentesMundos] 
 */

CREATE TABLE [continentesMundos](
    [ctnMunID]  int    IDENTITY(1,1),
    [munID]     int    NOT NULL,
    [ctnID]     int    NOT NULL
)
go



IF OBJECT_ID('continentesMundos') IS NOT NULL
    PRINT '<<< CREATED TABLE continentesMundos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE continentesMundos >>>'
go

/* 
 * TABLE: [continentesMundos] 
 */

ALTER TABLE [continentesMundos] ADD 
    CONSTRAINT [ctnMunIxPk] PRIMARY KEY CLUSTERED ([ctnMunID])
go

IF OBJECT_ID('continentesMundos') IS NOT NULL
    PRINT '<<< CREATED TABLE continentesMundos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE continentesMundos >>>'
go

/* 
 * INDEX: [ctnMunIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('continentesMundos') AND name='ctnMunIxAk')
BEGIN
    DROP INDEX [continentesMundos].[ctnMunIxAk]
    PRINT '<<< DROPPED INDEX [continentesMundos].[ctnMunIxAk] >>>'
END
go

/* 
 * INDEX: [ctnMunIxFkMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('continentesMundos') AND name='ctnMunIxFkMun')
BEGIN
    DROP INDEX [continentesMundos].[ctnMunIxFkMun]
    PRINT '<<< DROPPED INDEX [continentesMundos].[ctnMunIxFkMun] >>>'
END
go

/* 
 * INDEX: [munFkCtnMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('continentesMundos') AND name='munFkCtnMun')
BEGIN
    DROP INDEX [continentesMundos].[munFkCtnMun]
    PRINT '<<< DROPPED INDEX [continentesMundos].[munFkCtnMun] >>>'
END
go

/* 
 * INDEX: [ctnFkCtnMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('continentesMundos') AND name='ctnFkCtnMun')
BEGIN
    DROP INDEX [continentesMundos].[ctnFkCtnMun]
    PRINT '<<< DROPPED INDEX [continentesMundos].[ctnFkCtnMun] >>>'
END
go

/* 
 * INDEX: [ctnMunIxAk] 
 */

CREATE UNIQUE INDEX [ctnMunIxAk] ON [continentesMundos]([ctnID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('continentesMundos') AND name='ctnMunIxAk')
    PRINT '<<< CREATED INDEX continentesMundos.ctnMunIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX continentesMundos.ctnMunIxAk >>>'
go

/* 
 * INDEX: [ctnMunIxFkMun] 
 */

CREATE INDEX [ctnMunIxFkMun] ON [continentesMundos]([munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('continentesMundos') AND name='ctnMunIxFkMun')
    PRINT '<<< CREATED INDEX continentesMundos.ctnMunIxFkMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX continentesMundos.ctnMunIxFkMun >>>'
go

/* 
 * INDEX: [munFkCtnMun] 
 */

CREATE INDEX [munFkCtnMun] ON [continentesMundos]([munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('continentesMundos') AND name='munFkCtnMun')
    PRINT '<<< CREATED INDEX continentesMundos.munFkCtnMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX continentesMundos.munFkCtnMun >>>'
go

/* 
 * INDEX: [ctnFkCtnMun] 
 */

CREATE INDEX [ctnFkCtnMun] ON [continentesMundos]([ctnID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('continentesMundos') AND name='ctnFkCtnMun')
    PRINT '<<< CREATED INDEX continentesMundos.ctnFkCtnMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX continentesMundos.ctnFkCtnMun >>>'
go

