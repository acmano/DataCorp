IF OBJECT_ID('[geo].[nacoesMundos]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[nacoesMundos]
    PRINT '<<< DROPPED TABLE [geo].[nacoesMundos] >>>'
END
go
/* 
 * TABLE: [geo].[nacoesMundos] 
 */

CREATE TABLE [geo].[nacoesMundos](
    [nacMunID]  int    IDENTITY(1,1),
    [nacID]     int    NOT NULL,
    [munID]     int    NOT NULL
)
go



IF OBJECT_ID('geo.nacoesMundos') IS NOT NULL
    PRINT '<<< CREATED TABLE geo.nacoesMundos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE geo.nacoesMundos >>>'
go

/* 
 * TABLE: [geo].[nacoesMundos] 
 */

ALTER TABLE [geo].[nacoesMundos] ADD 
    CONSTRAINT [nacMunIxPk] PRIMARY KEY CLUSTERED ([nacMunID])
go

IF OBJECT_ID('geo.nacoesMundos') IS NOT NULL
    PRINT '<<< CREATED TABLE geo.nacoesMundos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE geo.nacoesMundos >>>'
go

/* 
 * INDEX: [nacMunIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesMundos') AND name='nacMunIxAk')
BEGIN
    DROP INDEX [geo].[nacoesMundos].[nacMunIxAk]
    PRINT '<<< DROPPED INDEX [geo].[nacoesMundos].[nacMunIxAk] >>>'
END
go

/* 
 * INDEX: [nacMunIxFkNac] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesMundos') AND name='nacMunIxFkNac')
BEGIN
    DROP INDEX [geo].[nacoesMundos].[nacMunIxFkNac]
    PRINT '<<< DROPPED INDEX [geo].[nacoesMundos].[nacMunIxFkNac] >>>'
END
go

/* 
 * INDEX: [nacFkEntMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesMundos') AND name='nacFkEntMun')
BEGIN
    DROP INDEX [geo].[nacoesMundos].[nacFkEntMun]
    PRINT '<<< DROPPED INDEX [geo].[nacoesMundos].[nacFkEntMun] >>>'
END
go

/* 
 * INDEX: [munFkNacMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesMundos') AND name='munFkNacMun')
BEGIN
    DROP INDEX [geo].[nacoesMundos].[munFkNacMun]
    PRINT '<<< DROPPED INDEX [geo].[nacoesMundos].[munFkNacMun] >>>'
END
go

/* 
 * INDEX: [nacMunIxAk] 
 */

CREATE UNIQUE INDEX [nacMunIxAk] ON [geo].[nacoesMundos]([munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesMundos') AND name='nacMunIxAk')
    PRINT '<<< CREATED INDEX geo.nacoesMundos.nacMunIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.nacoesMundos.nacMunIxAk >>>'
go

/* 
 * INDEX: [nacMunIxFkNac] 
 */

CREATE INDEX [nacMunIxFkNac] ON [geo].[nacoesMundos]([nacID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesMundos') AND name='nacMunIxFkNac')
    PRINT '<<< CREATED INDEX geo.nacoesMundos.nacMunIxFkNac >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.nacoesMundos.nacMunIxFkNac >>>'
go

/* 
 * INDEX: [nacFkEntMun] 
 */

CREATE INDEX [nacFkEntMun] ON [geo].[nacoesMundos]([nacID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesMundos') AND name='nacFkEntMun')
    PRINT '<<< CREATED INDEX geo.nacoesMundos.nacFkEntMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.nacoesMundos.nacFkEntMun >>>'
go

/* 
 * INDEX: [munFkNacMun] 
 */

CREATE INDEX [munFkNacMun] ON [geo].[nacoesMundos]([munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesMundos') AND name='munFkNacMun')
    PRINT '<<< CREATED INDEX geo.nacoesMundos.munFkNacMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.nacoesMundos.munFkNacMun >>>'
go

