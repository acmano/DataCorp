IF OBJECT_ID('[ibge].[subDistritosDistrito]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[subDistritosDistrito]
    PRINT '<<< DROPPED TABLE [ibge].[subDistritosDistrito] >>>'
END
go
/* 
 * TABLE: [ibge].[subDistritosDistrito] 
 */

CREATE TABLE [ibge].[subDistritosDistrito](
    [subDisDisID]  int    IDENTITY(1,1),
    [disID]        int    NOT NULL,
    [subDisID]     int    NOT NULL
)
go



IF OBJECT_ID('ibge.subDistritosDistrito') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.subDistritosDistrito >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.subDistritosDistrito >>>'
go

/* 
 * TABLE: [ibge].[subDistritosDistrito] 
 */

ALTER TABLE [ibge].[subDistritosDistrito] ADD 
    CONSTRAINT [subDisDisIxPk] PRIMARY KEY CLUSTERED ([subDisDisID])
go

IF OBJECT_ID('ibge.subDistritosDistrito') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.subDistritosDistrito >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.subDistritosDistrito >>>'
go

/* 
 * INDEX: [subDisDisIxAK] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.subDistritosDistrito') AND name='subDisDisIxAK')
BEGIN
    DROP INDEX [ibge].[subDistritosDistrito].[subDisDisIxAK]
    PRINT '<<< DROPPED INDEX [ibge].[subDistritosDistrito].[subDisDisIxAK] >>>'
END
go

/* 
 * INDEX: [subDisDisIxFkDis] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.subDistritosDistrito') AND name='subDisDisIxFkDis')
BEGIN
    DROP INDEX [ibge].[subDistritosDistrito].[subDisDisIxFkDis]
    PRINT '<<< DROPPED INDEX [ibge].[subDistritosDistrito].[subDisDisIxFkDis] >>>'
END
go

/* 
 * INDEX: [subDisDisIxFkSubDis] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.subDistritosDistrito') AND name='subDisDisIxFkSubDis')
BEGIN
    DROP INDEX [ibge].[subDistritosDistrito].[subDisDisIxFkSubDis]
    PRINT '<<< DROPPED INDEX [ibge].[subDistritosDistrito].[subDisDisIxFkSubDis] >>>'
END
go

/* 
 * INDEX: [disFkSubDisDis] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.subDistritosDistrito') AND name='disFkSubDisDis')
BEGIN
    DROP INDEX [ibge].[subDistritosDistrito].[disFkSubDisDis]
    PRINT '<<< DROPPED INDEX [ibge].[subDistritosDistrito].[disFkSubDisDis] >>>'
END
go

/* 
 * INDEX: [subDisFkSubDisDis] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.subDistritosDistrito') AND name='subDisFkSubDisDis')
BEGIN
    DROP INDEX [ibge].[subDistritosDistrito].[subDisFkSubDisDis]
    PRINT '<<< DROPPED INDEX [ibge].[subDistritosDistrito].[subDisFkSubDisDis] >>>'
END
go

/* 
 * INDEX: [subDisDisIxAK] 
 */

CREATE UNIQUE INDEX [subDisDisIxAK] ON [ibge].[subDistritosDistrito]([disID], [subDisID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.subDistritosDistrito') AND name='subDisDisIxAK')
    PRINT '<<< CREATED INDEX ibge.subDistritosDistrito.subDisDisIxAK >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.subDistritosDistrito.subDisDisIxAK >>>'
go

/* 
 * INDEX: [subDisDisIxFkDis] 
 */

CREATE INDEX [subDisDisIxFkDis] ON [ibge].[subDistritosDistrito]([disID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.subDistritosDistrito') AND name='subDisDisIxFkDis')
    PRINT '<<< CREATED INDEX ibge.subDistritosDistrito.subDisDisIxFkDis >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.subDistritosDistrito.subDisDisIxFkDis >>>'
go

/* 
 * INDEX: [subDisDisIxFkSubDis] 
 */

CREATE INDEX [subDisDisIxFkSubDis] ON [ibge].[subDistritosDistrito]([subDisID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.subDistritosDistrito') AND name='subDisDisIxFkSubDis')
    PRINT '<<< CREATED INDEX ibge.subDistritosDistrito.subDisDisIxFkSubDis >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.subDistritosDistrito.subDisDisIxFkSubDis >>>'
go

/* 
 * INDEX: [disFkSubDisDis] 
 */

CREATE INDEX [disFkSubDisDis] ON [ibge].[subDistritosDistrito]([disID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.subDistritosDistrito') AND name='disFkSubDisDis')
    PRINT '<<< CREATED INDEX ibge.subDistritosDistrito.disFkSubDisDis >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.subDistritosDistrito.disFkSubDisDis >>>'
go

/* 
 * INDEX: [subDisFkSubDisDis] 
 */

CREATE INDEX [subDisFkSubDisDis] ON [ibge].[subDistritosDistrito]([subDisID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.subDistritosDistrito') AND name='subDisFkSubDisDis')
    PRINT '<<< CREATED INDEX ibge.subDistritosDistrito.subDisFkSubDisDis >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.subDistritosDistrito.subDisFkSubDisDis >>>'
go

