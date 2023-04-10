IF OBJECT_ID('[cepsDistritos]') IS NOT NULL
BEGIN
    DROP TABLE [cepsDistritos]
    PRINT '<<< DROPPED TABLE [cepsDistritos] >>>'
END
go
/* 
 * TABLE: [cepsDistritos] 
 */

CREATE TABLE [cepsDistritos](
    [cepDisID]  int    IDENTITY(1,1),
    [disID]     int    NOT NULL,
    [cepID]     int    NOT NULL
)
go



IF OBJECT_ID('cepsDistritos') IS NOT NULL
    PRINT '<<< CREATED TABLE cepsDistritos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cepsDistritos >>>'
go

/* 
 * TABLE: [cepsDistritos] 
 */

ALTER TABLE [cepsDistritos] ADD 
    CONSTRAINT [cepDisIxPk] PRIMARY KEY CLUSTERED ([cepDisID])
go

IF OBJECT_ID('cepsDistritos') IS NOT NULL
    PRINT '<<< CREATED TABLE cepsDistritos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cepsDistritos >>>'
go

/* 
 * INDEX: [cepDisIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsDistritos') AND name='cepDisIxAk')
BEGIN
    DROP INDEX [cepsDistritos].[cepDisIxAk]
    PRINT '<<< DROPPED INDEX [cepsDistritos].[cepDisIxAk] >>>'
END
go

/* 
 * INDEX: [cepDisIxFkDis] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsDistritos') AND name='cepDisIxFkDis')
BEGIN
    DROP INDEX [cepsDistritos].[cepDisIxFkDis]
    PRINT '<<< DROPPED INDEX [cepsDistritos].[cepDisIxFkDis] >>>'
END
go

/* 
 * INDEX: [disFkCepDis] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsDistritos') AND name='disFkCepDis')
BEGIN
    DROP INDEX [cepsDistritos].[disFkCepDis]
    PRINT '<<< DROPPED INDEX [cepsDistritos].[disFkCepDis] >>>'
END
go

/* 
 * INDEX: [cepFkCepDis] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsDistritos') AND name='cepFkCepDis')
BEGIN
    DROP INDEX [cepsDistritos].[cepFkCepDis]
    PRINT '<<< DROPPED INDEX [cepsDistritos].[cepFkCepDis] >>>'
END
go

/* 
 * INDEX: [cepDisIxAk] 
 */

CREATE UNIQUE INDEX [cepDisIxAk] ON [cepsDistritos]([disID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsDistritos') AND name='cepDisIxAk')
    PRINT '<<< CREATED INDEX cepsDistritos.cepDisIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cepsDistritos.cepDisIxAk >>>'
go

/* 
 * INDEX: [cepDisIxFkDis] 
 */

CREATE INDEX [cepDisIxFkDis] ON [cepsDistritos]([disID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsDistritos') AND name='cepDisIxFkDis')
    PRINT '<<< CREATED INDEX cepsDistritos.cepDisIxFkDis >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cepsDistritos.cepDisIxFkDis >>>'
go

/* 
 * INDEX: [disFkCepDis] 
 */

CREATE INDEX [disFkCepDis] ON [cepsDistritos]([disID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsDistritos') AND name='disFkCepDis')
    PRINT '<<< CREATED INDEX cepsDistritos.disFkCepDis >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cepsDistritos.disFkCepDis >>>'
go

/* 
 * INDEX: [cepFkCepDis] 
 */

CREATE INDEX [cepFkCepDis] ON [cepsDistritos]([cepID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsDistritos') AND name='cepFkCepDis')
    PRINT '<<< CREATED INDEX cepsDistritos.cepFkCepDis >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cepsDistritos.cepFkCepDis >>>'
go

