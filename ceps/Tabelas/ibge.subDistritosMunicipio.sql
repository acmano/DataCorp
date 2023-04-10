IF OBJECT_ID('[ibge].[subDistritosMunicipio]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[subDistritosMunicipio]
    PRINT '<<< DROPPED TABLE [ibge].[subDistritosMunicipio] >>>'
END
go
/* 
 * TABLE: [ibge].[subDistritosMunicipio] 
 */

CREATE TABLE [ibge].[subDistritosMunicipio](
    [subDisMunID]  int    IDENTITY(1,1),
    [munID]        int    NOT NULL,
    [subDisID]     int    NOT NULL
)
go



IF OBJECT_ID('ibge.subDistritosMunicipio') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.subDistritosMunicipio >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.subDistritosMunicipio >>>'
go

/* 
 * TABLE: [ibge].[subDistritosMunicipio] 
 */

ALTER TABLE [ibge].[subDistritosMunicipio] ADD 
    CONSTRAINT [subDisMunIxPk] PRIMARY KEY CLUSTERED ([subDisMunID])
go

IF OBJECT_ID('ibge.subDistritosMunicipio') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.subDistritosMunicipio >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.subDistritosMunicipio >>>'
go

/* 
 * INDEX: [subDisMunIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.subDistritosMunicipio') AND name='subDisMunIxAk')
BEGIN
    DROP INDEX [ibge].[subDistritosMunicipio].[subDisMunIxAk]
    PRINT '<<< DROPPED INDEX [ibge].[subDistritosMunicipio].[subDisMunIxAk] >>>'
END
go

/* 
 * INDEX: [subDisMunIxFkMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.subDistritosMunicipio') AND name='subDisMunIxFkMun')
BEGIN
    DROP INDEX [ibge].[subDistritosMunicipio].[subDisMunIxFkMun]
    PRINT '<<< DROPPED INDEX [ibge].[subDistritosMunicipio].[subDisMunIxFkMun] >>>'
END
go

/* 
 * INDEX: [subDisMunIxFkSubDis] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.subDistritosMunicipio') AND name='subDisMunIxFkSubDis')
BEGIN
    DROP INDEX [ibge].[subDistritosMunicipio].[subDisMunIxFkSubDis]
    PRINT '<<< DROPPED INDEX [ibge].[subDistritosMunicipio].[subDisMunIxFkSubDis] >>>'
END
go

/* 
 * INDEX: [munFkSubDisMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.subDistritosMunicipio') AND name='munFkSubDisMun')
BEGIN
    DROP INDEX [ibge].[subDistritosMunicipio].[munFkSubDisMun]
    PRINT '<<< DROPPED INDEX [ibge].[subDistritosMunicipio].[munFkSubDisMun] >>>'
END
go

/* 
 * INDEX: [subDisFkSubDisMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.subDistritosMunicipio') AND name='subDisFkSubDisMun')
BEGIN
    DROP INDEX [ibge].[subDistritosMunicipio].[subDisFkSubDisMun]
    PRINT '<<< DROPPED INDEX [ibge].[subDistritosMunicipio].[subDisFkSubDisMun] >>>'
END
go

/* 
 * INDEX: [subDisMunIxAk] 
 */

CREATE UNIQUE INDEX [subDisMunIxAk] ON [ibge].[subDistritosMunicipio]([munID], [subDisID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.subDistritosMunicipio') AND name='subDisMunIxAk')
    PRINT '<<< CREATED INDEX ibge.subDistritosMunicipio.subDisMunIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.subDistritosMunicipio.subDisMunIxAk >>>'
go

/* 
 * INDEX: [subDisMunIxFkMun] 
 */

CREATE INDEX [subDisMunIxFkMun] ON [ibge].[subDistritosMunicipio]([munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.subDistritosMunicipio') AND name='subDisMunIxFkMun')
    PRINT '<<< CREATED INDEX ibge.subDistritosMunicipio.subDisMunIxFkMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.subDistritosMunicipio.subDisMunIxFkMun >>>'
go

/* 
 * INDEX: [subDisMunIxFkSubDis] 
 */

CREATE INDEX [subDisMunIxFkSubDis] ON [ibge].[subDistritosMunicipio]([subDisID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.subDistritosMunicipio') AND name='subDisMunIxFkSubDis')
    PRINT '<<< CREATED INDEX ibge.subDistritosMunicipio.subDisMunIxFkSubDis >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.subDistritosMunicipio.subDisMunIxFkSubDis >>>'
go

/* 
 * INDEX: [munFkSubDisMun] 
 */

CREATE INDEX [munFkSubDisMun] ON [ibge].[subDistritosMunicipio]([munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.subDistritosMunicipio') AND name='munFkSubDisMun')
    PRINT '<<< CREATED INDEX ibge.subDistritosMunicipio.munFkSubDisMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.subDistritosMunicipio.munFkSubDisMun >>>'
go

/* 
 * INDEX: [subDisFkSubDisMun] 
 */

CREATE INDEX [subDisFkSubDisMun] ON [ibge].[subDistritosMunicipio]([subDisID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.subDistritosMunicipio') AND name='subDisFkSubDisMun')
    PRINT '<<< CREATED INDEX ibge.subDistritosMunicipio.subDisFkSubDisMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.subDistritosMunicipio.subDisFkSubDisMun >>>'
go

