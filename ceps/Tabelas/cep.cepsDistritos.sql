IF OBJECT_ID('[cep].[cepsDistritos]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[cepsDistritos]
    PRINT '<<< DROPPED TABLE [cep].[cepsDistritos] >>>'
END
go
/* 
 * TABLE: [cep].[cepsDistritos] 
 */

CREATE TABLE [cep].[cepsDistritos](
    [cepDisID]  int    IDENTITY(1,1),
    [disID]     int    NOT NULL,
    [cepID]     int    NOT NULL
)
go



IF OBJECT_ID('cep.cepsDistritos') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.cepsDistritos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.cepsDistritos >>>'
go

/* 
 * TABLE: [cep].[cepsDistritos] 
 */

ALTER TABLE [cep].[cepsDistritos] ADD 
    CONSTRAINT [cepDisIxPk] PRIMARY KEY CLUSTERED ([cepDisID])
go

IF OBJECT_ID('cep.cepsDistritos') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.cepsDistritos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.cepsDistritos >>>'
go

/* 
 * INDEX: [cepDisIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsDistritos') AND name='cepDisIxAk')
BEGIN
    DROP INDEX [cep].[cepsDistritos].[cepDisIxAk]
    PRINT '<<< DROPPED INDEX [cep].[cepsDistritos].[cepDisIxAk] >>>'
END
go

/* 
 * INDEX: [cepDisIxFkDis] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsDistritos') AND name='cepDisIxFkDis')
BEGIN
    DROP INDEX [cep].[cepsDistritos].[cepDisIxFkDis]
    PRINT '<<< DROPPED INDEX [cep].[cepsDistritos].[cepDisIxFkDis] >>>'
END
go

/* 
 * INDEX: [disFkCepDis] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsDistritos') AND name='disFkCepDis')
BEGIN
    DROP INDEX [cep].[cepsDistritos].[disFkCepDis]
    PRINT '<<< DROPPED INDEX [cep].[cepsDistritos].[disFkCepDis] >>>'
END
go

/* 
 * INDEX: [cepFkCepDis] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsDistritos') AND name='cepFkCepDis')
BEGIN
    DROP INDEX [cep].[cepsDistritos].[cepFkCepDis]
    PRINT '<<< DROPPED INDEX [cep].[cepsDistritos].[cepFkCepDis] >>>'
END
go

/* 
 * INDEX: [cepDisIxAk] 
 */

CREATE UNIQUE INDEX [cepDisIxAk] ON [cep].[cepsDistritos]([disID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsDistritos') AND name='cepDisIxAk')
    PRINT '<<< CREATED INDEX cep.cepsDistritos.cepDisIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.cepsDistritos.cepDisIxAk >>>'
go

/* 
 * INDEX: [cepDisIxFkDis] 
 */

CREATE INDEX [cepDisIxFkDis] ON [cep].[cepsDistritos]([disID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsDistritos') AND name='cepDisIxFkDis')
    PRINT '<<< CREATED INDEX cep.cepsDistritos.cepDisIxFkDis >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.cepsDistritos.cepDisIxFkDis >>>'
go

/* 
 * INDEX: [disFkCepDis] 
 */

CREATE INDEX [disFkCepDis] ON [cep].[cepsDistritos]([disID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsDistritos') AND name='disFkCepDis')
    PRINT '<<< CREATED INDEX cep.cepsDistritos.disFkCepDis >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.cepsDistritos.disFkCepDis >>>'
go

/* 
 * INDEX: [cepFkCepDis] 
 */

CREATE INDEX [cepFkCepDis] ON [cep].[cepsDistritos]([cepID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsDistritos') AND name='cepFkCepDis')
    PRINT '<<< CREATED INDEX cep.cepsDistritos.cepFkCepDis >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.cepsDistritos.cepFkCepDis >>>'
go

