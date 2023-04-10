IF OBJECT_ID('[cepsMunicipios]') IS NOT NULL
BEGIN
    DROP TABLE [cepsMunicipios]
    PRINT '<<< DROPPED TABLE [cepsMunicipios] >>>'
END
go
/* 
 * TABLE: [cepsMunicipios] 
 */

CREATE TABLE [cepsMunicipios](
    [cepMunID]  int    IDENTITY(1,1),
    [munID]     int    NOT NULL,
    [cepID]     int    NOT NULL
)
go



IF OBJECT_ID('cepsMunicipios') IS NOT NULL
    PRINT '<<< CREATED TABLE cepsMunicipios >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cepsMunicipios >>>'
go

/* 
 * TABLE: [cepsMunicipios] 
 */

ALTER TABLE [cepsMunicipios] ADD 
    CONSTRAINT [cepMunIxPk] PRIMARY KEY CLUSTERED ([cepMunID])
go

IF OBJECT_ID('cepsMunicipios') IS NOT NULL
    PRINT '<<< CREATED TABLE cepsMunicipios >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cepsMunicipios >>>'
go

/* 
 * INDEX: [cepMunIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsMunicipios') AND name='cepMunIxAk')
BEGIN
    DROP INDEX [cepsMunicipios].[cepMunIxAk]
    PRINT '<<< DROPPED INDEX [cepsMunicipios].[cepMunIxAk] >>>'
END
go

/* 
 * INDEX: [cepMunIxFkMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsMunicipios') AND name='cepMunIxFkMun')
BEGIN
    DROP INDEX [cepsMunicipios].[cepMunIxFkMun]
    PRINT '<<< DROPPED INDEX [cepsMunicipios].[cepMunIxFkMun] >>>'
END
go

/* 
 * INDEX: [munFkCepMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsMunicipios') AND name='munFkCepMun')
BEGIN
    DROP INDEX [cepsMunicipios].[munFkCepMun]
    PRINT '<<< DROPPED INDEX [cepsMunicipios].[munFkCepMun] >>>'
END
go

/* 
 * INDEX: [cepFkCepMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsMunicipios') AND name='cepFkCepMun')
BEGIN
    DROP INDEX [cepsMunicipios].[cepFkCepMun]
    PRINT '<<< DROPPED INDEX [cepsMunicipios].[cepFkCepMun] >>>'
END
go

/* 
 * INDEX: [cepMunIxAk] 
 */

CREATE UNIQUE INDEX [cepMunIxAk] ON [cepsMunicipios]([munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsMunicipios') AND name='cepMunIxAk')
    PRINT '<<< CREATED INDEX cepsMunicipios.cepMunIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cepsMunicipios.cepMunIxAk >>>'
go

/* 
 * INDEX: [cepMunIxFkMun] 
 */

CREATE INDEX [cepMunIxFkMun] ON [cepsMunicipios]([munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsMunicipios') AND name='cepMunIxFkMun')
    PRINT '<<< CREATED INDEX cepsMunicipios.cepMunIxFkMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cepsMunicipios.cepMunIxFkMun >>>'
go

/* 
 * INDEX: [munFkCepMun] 
 */

CREATE INDEX [munFkCepMun] ON [cepsMunicipios]([munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsMunicipios') AND name='munFkCepMun')
    PRINT '<<< CREATED INDEX cepsMunicipios.munFkCepMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cepsMunicipios.munFkCepMun >>>'
go

/* 
 * INDEX: [cepFkCepMun] 
 */

CREATE INDEX [cepFkCepMun] ON [cepsMunicipios]([cepID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cepsMunicipios') AND name='cepFkCepMun')
    PRINT '<<< CREATED INDEX cepsMunicipios.cepFkCepMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cepsMunicipios.cepFkCepMun >>>'
go

