IF OBJECT_ID('[cepsSubDistritos]') IS NOT NULL
BEGIN
    DROP TABLE [cepsSubDistritos]
    PRINT '<<< DROPPED TABLE [cepsSubDistritos] >>>'
END
go
/* 
 * TABLE: [cepsSubDistritos] 
 */

CREATE TABLE [cepsSubDistritos](
    [cepSubDisID]  int    IDENTITY(1,1),
    [subDisID]     int    NOT NULL,
    [cepID]        int    NOT NULL
)
go



IF OBJECT_ID('cepsSubDistritos') IS NOT NULL
    PRINT '<<< CREATED TABLE cepsSubDistritos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cepsSubDistritos >>>'
go

/* 
 * TABLE: [cepsSubDistritos] 
 */

ALTER TABLE [cepsSubDistritos] ADD 
    CONSTRAINT [cepSubDisIxPk] PRIMARY KEY CLUSTERED ([cepSubDisID])
go

IF OBJECT_ID('cepsSubDistritos') IS NOT NULL
    PRINT '<<< CREATED TABLE cepsSubDistritos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cepsSubDistritos >>>'
go

/* 
 * INDEX: [cepSubDisIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsSubDistritos') AND name='cepSubDisIxAk')
BEGIN
    DROP INDEX [cepsSubDistritos].[cepSubDisIxAk]
    PRINT '<<< DROPPED INDEX [cepsSubDistritos].[cepSubDisIxAk] >>>'
END
go

/* 
 * INDEX: [cepSubDisIxFkSubDis] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsSubDistritos') AND name='cepSubDisIxFkSubDis')
BEGIN
    DROP INDEX [cepsSubDistritos].[cepSubDisIxFkSubDis]
    PRINT '<<< DROPPED INDEX [cepsSubDistritos].[cepSubDisIxFkSubDis] >>>'
END
go

/* 
 * INDEX: [subDisFkCepDis] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsSubDistritos') AND name='subDisFkCepDis')
BEGIN
    DROP INDEX [cepsSubDistritos].[subDisFkCepDis]
    PRINT '<<< DROPPED INDEX [cepsSubDistritos].[subDisFkCepDis] >>>'
END
go

/* 
 * INDEX: [cepFkCepSubDis] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsSubDistritos') AND name='cepFkCepSubDis')
BEGIN
    DROP INDEX [cepsSubDistritos].[cepFkCepSubDis]
    PRINT '<<< DROPPED INDEX [cepsSubDistritos].[cepFkCepSubDis] >>>'
END
go

/* 
 * INDEX: [cepSubDisIxAk] 
 */

CREATE UNIQUE INDEX [cepSubDisIxAk] ON [cepsSubDistritos]([subDisID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsSubDistritos') AND name='cepSubDisIxAk')
    PRINT '<<< CREATED INDEX cepsSubDistritos.cepSubDisIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cepsSubDistritos.cepSubDisIxAk >>>'
go

/* 
 * INDEX: [cepSubDisIxFkSubDis] 
 */

CREATE INDEX [cepSubDisIxFkSubDis] ON [cepsSubDistritos]([subDisID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsSubDistritos') AND name='cepSubDisIxFkSubDis')
    PRINT '<<< CREATED INDEX cepsSubDistritos.cepSubDisIxFkSubDis >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cepsSubDistritos.cepSubDisIxFkSubDis >>>'
go

/* 
 * INDEX: [subDisFkCepDis] 
 */

CREATE INDEX [subDisFkCepDis] ON [cepsSubDistritos]([subDisID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsSubDistritos') AND name='subDisFkCepDis')
    PRINT '<<< CREATED INDEX cepsSubDistritos.subDisFkCepDis >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cepsSubDistritos.subDisFkCepDis >>>'
go

/* 
 * INDEX: [cepFkCepSubDis] 
 */

CREATE INDEX [cepFkCepSubDis] ON [cepsSubDistritos]([cepID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsSubDistritos') AND name='cepFkCepSubDis')
    PRINT '<<< CREATED INDEX cepsSubDistritos.cepFkCepSubDis >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cepsSubDistritos.cepFkCepSubDis >>>'
go

