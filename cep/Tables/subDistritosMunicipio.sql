IF OBJECT_ID('[subDistritosMunicipio]') IS NOT NULL
BEGIN
    DROP TABLE [subDistritosMunicipio]
    PRINT '<<< DROPPED TABLE [subDistritosMunicipio] >>>'
END
go
/* 
 * TABLE: [subDistritosMunicipio] 
 */

CREATE TABLE [subDistritosMunicipio](
    [subDisMunID]  int    IDENTITY(1,1),
    [munID]        int    NOT NULL,
    [subDisID]     int    NOT NULL
)
go



IF OBJECT_ID('subDistritosMunicipio') IS NOT NULL
    PRINT '<<< CREATED TABLE subDistritosMunicipio >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE subDistritosMunicipio >>>'
go

/* 
 * TABLE: [subDistritosMunicipio] 
 */

ALTER TABLE [subDistritosMunicipio] ADD 
    CONSTRAINT [subDisMunIxPk] PRIMARY KEY CLUSTERED ([subDisMunID])
go

IF OBJECT_ID('subDistritosMunicipio') IS NOT NULL
    PRINT '<<< CREATED TABLE subDistritosMunicipio >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE subDistritosMunicipio >>>'
go

/* 
 * INDEX: [subDisMunIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subDistritosMunicipio') AND name='subDisMunIxAk')
BEGIN
    DROP INDEX [subDistritosMunicipio].[subDisMunIxAk]
    PRINT '<<< DROPPED INDEX [subDistritosMunicipio].[subDisMunIxAk] >>>'
END
go

/* 
 * INDEX: [subDisMunIxFkMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subDistritosMunicipio') AND name='subDisMunIxFkMun')
BEGIN
    DROP INDEX [subDistritosMunicipio].[subDisMunIxFkMun]
    PRINT '<<< DROPPED INDEX [subDistritosMunicipio].[subDisMunIxFkMun] >>>'
END
go

/* 
 * INDEX: [subDisMunIxFkSubDis] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subDistritosMunicipio') AND name='subDisMunIxFkSubDis')
BEGIN
    DROP INDEX [subDistritosMunicipio].[subDisMunIxFkSubDis]
    PRINT '<<< DROPPED INDEX [subDistritosMunicipio].[subDisMunIxFkSubDis] >>>'
END
go

/* 
 * INDEX: [munFkSubDisMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subDistritosMunicipio') AND name='munFkSubDisMun')
BEGIN
    DROP INDEX [subDistritosMunicipio].[munFkSubDisMun]
    PRINT '<<< DROPPED INDEX [subDistritosMunicipio].[munFkSubDisMun] >>>'
END
go

/* 
 * INDEX: [subDisFkSubDisMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subDistritosMunicipio') AND name='subDisFkSubDisMun')
BEGIN
    DROP INDEX [subDistritosMunicipio].[subDisFkSubDisMun]
    PRINT '<<< DROPPED INDEX [subDistritosMunicipio].[subDisFkSubDisMun] >>>'
END
go

/* 
 * INDEX: [subDisMunIxAk] 
 */

CREATE UNIQUE INDEX [subDisMunIxAk] ON [subDistritosMunicipio]([munID], [subDisID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subDistritosMunicipio') AND name='subDisMunIxAk')
    PRINT '<<< CREATED INDEX subDistritosMunicipio.subDisMunIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX subDistritosMunicipio.subDisMunIxAk >>>'
go

/* 
 * INDEX: [subDisMunIxFkMun] 
 */

CREATE INDEX [subDisMunIxFkMun] ON [subDistritosMunicipio]([munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subDistritosMunicipio') AND name='subDisMunIxFkMun')
    PRINT '<<< CREATED INDEX subDistritosMunicipio.subDisMunIxFkMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX subDistritosMunicipio.subDisMunIxFkMun >>>'
go

/* 
 * INDEX: [subDisMunIxFkSubDis] 
 */

CREATE INDEX [subDisMunIxFkSubDis] ON [subDistritosMunicipio]([subDisID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subDistritosMunicipio') AND name='subDisMunIxFkSubDis')
    PRINT '<<< CREATED INDEX subDistritosMunicipio.subDisMunIxFkSubDis >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX subDistritosMunicipio.subDisMunIxFkSubDis >>>'
go

/* 
 * INDEX: [munFkSubDisMun] 
 */

CREATE INDEX [munFkSubDisMun] ON [subDistritosMunicipio]([munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subDistritosMunicipio') AND name='munFkSubDisMun')
    PRINT '<<< CREATED INDEX subDistritosMunicipio.munFkSubDisMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX subDistritosMunicipio.munFkSubDisMun >>>'
go

/* 
 * INDEX: [subDisFkSubDisMun] 
 */

CREATE INDEX [subDisFkSubDisMun] ON [subDistritosMunicipio]([subDisID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subDistritosMunicipio') AND name='subDisFkSubDisMun')
    PRINT '<<< CREATED INDEX subDistritosMunicipio.subDisFkSubDisMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX subDistritosMunicipio.subDisFkSubDisMun >>>'
go

