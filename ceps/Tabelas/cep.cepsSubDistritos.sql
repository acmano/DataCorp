IF OBJECT_ID('[cep].[cepsSubDistritos]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[cepsSubDistritos]
    PRINT '<<< DROPPED TABLE [cep].[cepsSubDistritos] >>>'
END
go
/* 
 * TABLE: [cep].[cepsSubDistritos] 
 */

CREATE TABLE [cep].[cepsSubDistritos](
    [cepSubDisID]  int    IDENTITY(1,1),
    [subDisID]     int    NOT NULL,
    [cepID]        int    NOT NULL
)
go



IF OBJECT_ID('cep.cepsSubDistritos') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.cepsSubDistritos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.cepsSubDistritos >>>'
go

/* 
 * TABLE: [cep].[cepsSubDistritos] 
 */

ALTER TABLE [cep].[cepsSubDistritos] ADD 
    CONSTRAINT [cepSubDisIxPk] PRIMARY KEY CLUSTERED ([cepSubDisID])
go

IF OBJECT_ID('cep.cepsSubDistritos') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.cepsSubDistritos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.cepsSubDistritos >>>'
go

/* 
 * INDEX: [cepSubDisIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsSubDistritos') AND name='cepSubDisIxAk')
BEGIN
    DROP INDEX [cep].[cepsSubDistritos].[cepSubDisIxAk]
    PRINT '<<< DROPPED INDEX [cep].[cepsSubDistritos].[cepSubDisIxAk] >>>'
END
go

/* 
 * INDEX: [cepSubDisIxFkSubDis] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsSubDistritos') AND name='cepSubDisIxFkSubDis')
BEGIN
    DROP INDEX [cep].[cepsSubDistritos].[cepSubDisIxFkSubDis]
    PRINT '<<< DROPPED INDEX [cep].[cepsSubDistritos].[cepSubDisIxFkSubDis] >>>'
END
go

/* 
 * INDEX: [subDisFkCepDis] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsSubDistritos') AND name='subDisFkCepDis')
BEGIN
    DROP INDEX [cep].[cepsSubDistritos].[subDisFkCepDis]
    PRINT '<<< DROPPED INDEX [cep].[cepsSubDistritos].[subDisFkCepDis] >>>'
END
go

/* 
 * INDEX: [cepFkCepSubDis] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsSubDistritos') AND name='cepFkCepSubDis')
BEGIN
    DROP INDEX [cep].[cepsSubDistritos].[cepFkCepSubDis]
    PRINT '<<< DROPPED INDEX [cep].[cepsSubDistritos].[cepFkCepSubDis] >>>'
END
go

/* 
 * INDEX: [cepSubDisIxAk] 
 */

CREATE UNIQUE INDEX [cepSubDisIxAk] ON [cep].[cepsSubDistritos]([subDisID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsSubDistritos') AND name='cepSubDisIxAk')
    PRINT '<<< CREATED INDEX cep.cepsSubDistritos.cepSubDisIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.cepsSubDistritos.cepSubDisIxAk >>>'
go

/* 
 * INDEX: [cepSubDisIxFkSubDis] 
 */

CREATE INDEX [cepSubDisIxFkSubDis] ON [cep].[cepsSubDistritos]([subDisID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsSubDistritos') AND name='cepSubDisIxFkSubDis')
    PRINT '<<< CREATED INDEX cep.cepsSubDistritos.cepSubDisIxFkSubDis >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.cepsSubDistritos.cepSubDisIxFkSubDis >>>'
go

/* 
 * INDEX: [subDisFkCepDis] 
 */

CREATE INDEX [subDisFkCepDis] ON [cep].[cepsSubDistritos]([subDisID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsSubDistritos') AND name='subDisFkCepDis')
    PRINT '<<< CREATED INDEX cep.cepsSubDistritos.subDisFkCepDis >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.cepsSubDistritos.subDisFkCepDis >>>'
go

/* 
 * INDEX: [cepFkCepSubDis] 
 */

CREATE INDEX [cepFkCepSubDis] ON [cep].[cepsSubDistritos]([cepID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsSubDistritos') AND name='cepFkCepSubDis')
    PRINT '<<< CREATED INDEX cep.cepsSubDistritos.cepFkCepSubDis >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.cepsSubDistritos.cepFkCepSubDis >>>'
go

