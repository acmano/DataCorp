IF OBJECT_ID('[nacoesMundos]') IS NOT NULL
BEGIN
    DROP TABLE [nacoesMundos]
    PRINT '<<< DROPPED TABLE [nacoesMundos] >>>'
END
go
/* 
 * TABLE: [nacoesMundos] 
 */

CREATE TABLE [nacoesMundos](
    [nacMunID]  int    IDENTITY(1,1),
    [nacID]     int    NOT NULL,
    [munID]     int    NOT NULL
)
go



IF OBJECT_ID('nacoesMundos') IS NOT NULL
    PRINT '<<< CREATED TABLE nacoesMundos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE nacoesMundos >>>'
go

/* 
 * TABLE: [nacoesMundos] 
 */

ALTER TABLE [nacoesMundos] ADD 
    CONSTRAINT [nacMunIxPk] PRIMARY KEY CLUSTERED ([nacMunID])
go

IF OBJECT_ID('nacoesMundos') IS NOT NULL
    PRINT '<<< CREATED TABLE nacoesMundos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE nacoesMundos >>>'
go

/* 
 * INDEX: [nacMunIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesMundos') AND name='nacMunIxAk')
BEGIN
    DROP INDEX [nacoesMundos].[nacMunIxAk]
    PRINT '<<< DROPPED INDEX [nacoesMundos].[nacMunIxAk] >>>'
END
go

/* 
 * INDEX: [nacMunIxFkNac] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesMundos') AND name='nacMunIxFkNac')
BEGIN
    DROP INDEX [nacoesMundos].[nacMunIxFkNac]
    PRINT '<<< DROPPED INDEX [nacoesMundos].[nacMunIxFkNac] >>>'
END
go

/* 
 * INDEX: [nacFkEntMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesMundos') AND name='nacFkEntMun')
BEGIN
    DROP INDEX [nacoesMundos].[nacFkEntMun]
    PRINT '<<< DROPPED INDEX [nacoesMundos].[nacFkEntMun] >>>'
END
go

/* 
 * INDEX: [munFkNacMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesMundos') AND name='munFkNacMun')
BEGIN
    DROP INDEX [nacoesMundos].[munFkNacMun]
    PRINT '<<< DROPPED INDEX [nacoesMundos].[munFkNacMun] >>>'
END
go

/* 
 * INDEX: [nacMunIxAk] 
 */

CREATE UNIQUE INDEX [nacMunIxAk] ON [nacoesMundos]([munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesMundos') AND name='nacMunIxAk')
    PRINT '<<< CREATED INDEX nacoesMundos.nacMunIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX nacoesMundos.nacMunIxAk >>>'
go

/* 
 * INDEX: [nacMunIxFkNac] 
 */

CREATE INDEX [nacMunIxFkNac] ON [nacoesMundos]([nacID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesMundos') AND name='nacMunIxFkNac')
    PRINT '<<< CREATED INDEX nacoesMundos.nacMunIxFkNac >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX nacoesMundos.nacMunIxFkNac >>>'
go

/* 
 * INDEX: [nacFkEntMun] 
 */

CREATE INDEX [nacFkEntMun] ON [nacoesMundos]([nacID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesMundos') AND name='nacFkEntMun')
    PRINT '<<< CREATED INDEX nacoesMundos.nacFkEntMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX nacoesMundos.nacFkEntMun >>>'
go

/* 
 * INDEX: [munFkNacMun] 
 */

CREATE INDEX [munFkNacMun] ON [nacoesMundos]([munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesMundos') AND name='munFkNacMun')
    PRINT '<<< CREATED INDEX nacoesMundos.munFkNacMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX nacoesMundos.munFkNacMun >>>'
go

