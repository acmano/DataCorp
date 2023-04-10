IF OBJECT_ID('[subDistritosDistrito]') IS NOT NULL
BEGIN
    DROP TABLE [subDistritosDistrito]
    PRINT '<<< DROPPED TABLE [subDistritosDistrito] >>>'
END
go
/* 
 * TABLE: [subDistritosDistrito] 
 */

CREATE TABLE [subDistritosDistrito](
    [subDisDisID]  int    IDENTITY(1,1),
    [disID]        int    NOT NULL,
    [subDisID]     int    NOT NULL
)
go



IF OBJECT_ID('subDistritosDistrito') IS NOT NULL
    PRINT '<<< CREATED TABLE subDistritosDistrito >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE subDistritosDistrito >>>'
go

/* 
 * TABLE: [subDistritosDistrito] 
 */

ALTER TABLE [subDistritosDistrito] ADD 
    CONSTRAINT [subDisDisIxPk] PRIMARY KEY CLUSTERED ([subDisDisID])
go

IF OBJECT_ID('subDistritosDistrito') IS NOT NULL
    PRINT '<<< CREATED TABLE subDistritosDistrito >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE subDistritosDistrito >>>'
go

/* 
 * INDEX: [subDisDisIxAK] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subDistritosDistrito') AND name='subDisDisIxAK')
BEGIN
    DROP INDEX [subDistritosDistrito].[subDisDisIxAK]
    PRINT '<<< DROPPED INDEX [subDistritosDistrito].[subDisDisIxAK] >>>'
END
go

/* 
 * INDEX: [subDisDisIxFkDis] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subDistritosDistrito') AND name='subDisDisIxFkDis')
BEGIN
    DROP INDEX [subDistritosDistrito].[subDisDisIxFkDis]
    PRINT '<<< DROPPED INDEX [subDistritosDistrito].[subDisDisIxFkDis] >>>'
END
go

/* 
 * INDEX: [subDisDisIxFkSubDis] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subDistritosDistrito') AND name='subDisDisIxFkSubDis')
BEGIN
    DROP INDEX [subDistritosDistrito].[subDisDisIxFkSubDis]
    PRINT '<<< DROPPED INDEX [subDistritosDistrito].[subDisDisIxFkSubDis] >>>'
END
go

/* 
 * INDEX: [disFkSubDisDis] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subDistritosDistrito') AND name='disFkSubDisDis')
BEGIN
    DROP INDEX [subDistritosDistrito].[disFkSubDisDis]
    PRINT '<<< DROPPED INDEX [subDistritosDistrito].[disFkSubDisDis] >>>'
END
go

/* 
 * INDEX: [subDisFkSubDisDis] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subDistritosDistrito') AND name='subDisFkSubDisDis')
BEGIN
    DROP INDEX [subDistritosDistrito].[subDisFkSubDisDis]
    PRINT '<<< DROPPED INDEX [subDistritosDistrito].[subDisFkSubDisDis] >>>'
END
go

/* 
 * INDEX: [subDisDisIxAK] 
 */

CREATE UNIQUE INDEX [subDisDisIxAK] ON [subDistritosDistrito]([disID], [subDisID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subDistritosDistrito') AND name='subDisDisIxAK')
    PRINT '<<< CREATED INDEX subDistritosDistrito.subDisDisIxAK >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX subDistritosDistrito.subDisDisIxAK >>>'
go

/* 
 * INDEX: [subDisDisIxFkDis] 
 */

CREATE INDEX [subDisDisIxFkDis] ON [subDistritosDistrito]([disID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subDistritosDistrito') AND name='subDisDisIxFkDis')
    PRINT '<<< CREATED INDEX subDistritosDistrito.subDisDisIxFkDis >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX subDistritosDistrito.subDisDisIxFkDis >>>'
go

/* 
 * INDEX: [subDisDisIxFkSubDis] 
 */

CREATE INDEX [subDisDisIxFkSubDis] ON [subDistritosDistrito]([subDisID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subDistritosDistrito') AND name='subDisDisIxFkSubDis')
    PRINT '<<< CREATED INDEX subDistritosDistrito.subDisDisIxFkSubDis >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX subDistritosDistrito.subDisDisIxFkSubDis >>>'
go

/* 
 * INDEX: [disFkSubDisDis] 
 */

CREATE INDEX [disFkSubDisDis] ON [subDistritosDistrito]([disID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subDistritosDistrito') AND name='disFkSubDisDis')
    PRINT '<<< CREATED INDEX subDistritosDistrito.disFkSubDisDis >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX subDistritosDistrito.disFkSubDisDis >>>'
go

/* 
 * INDEX: [subDisFkSubDisDis] 
 */

CREATE INDEX [subDisFkSubDisDis] ON [subDistritosDistrito]([subDisID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subDistritosDistrito') AND name='subDisFkSubDisDis')
    PRINT '<<< CREATED INDEX subDistritosDistrito.subDisFkSubDisDis >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX subDistritosDistrito.subDisFkSubDisDis >>>'
go

