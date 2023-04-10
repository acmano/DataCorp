IF OBJECT_ID('[cep].[cepsMunicipios]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[cepsMunicipios]
    PRINT '<<< DROPPED TABLE [cep].[cepsMunicipios] >>>'
END
go
/* 
 * TABLE: [cep].[cepsMunicipios] 
 */

CREATE TABLE [cep].[cepsMunicipios](
    [cepMunID]  int    IDENTITY(1,1),
    [munID]     int    NOT NULL,
    [cepID]     int    NOT NULL
)
go



IF OBJECT_ID('cep.cepsMunicipios') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.cepsMunicipios >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.cepsMunicipios >>>'
go

/* 
 * TABLE: [cep].[cepsMunicipios] 
 */

ALTER TABLE [cep].[cepsMunicipios] ADD 
    CONSTRAINT [cepMunIxPk] PRIMARY KEY CLUSTERED ([cepMunID])
go

IF OBJECT_ID('cep.cepsMunicipios') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.cepsMunicipios >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.cepsMunicipios >>>'
go

/* 
 * INDEX: [cepMunIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsMunicipios') AND name='cepMunIxAk')
BEGIN
    DROP INDEX [cep].[cepsMunicipios].[cepMunIxAk]
    PRINT '<<< DROPPED INDEX [cep].[cepsMunicipios].[cepMunIxAk] >>>'
END
go

/* 
 * INDEX: [cepMunIxFkMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsMunicipios') AND name='cepMunIxFkMun')
BEGIN
    DROP INDEX [cep].[cepsMunicipios].[cepMunIxFkMun]
    PRINT '<<< DROPPED INDEX [cep].[cepsMunicipios].[cepMunIxFkMun] >>>'
END
go

/* 
 * INDEX: [munFkCepMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsMunicipios') AND name='munFkCepMun')
BEGIN
    DROP INDEX [cep].[cepsMunicipios].[munFkCepMun]
    PRINT '<<< DROPPED INDEX [cep].[cepsMunicipios].[munFkCepMun] >>>'
END
go

/* 
 * INDEX: [cepFkCepMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsMunicipios') AND name='cepFkCepMun')
BEGIN
    DROP INDEX [cep].[cepsMunicipios].[cepFkCepMun]
    PRINT '<<< DROPPED INDEX [cep].[cepsMunicipios].[cepFkCepMun] >>>'
END
go

/* 
 * INDEX: [cepMunIxAk] 
 */

CREATE UNIQUE INDEX [cepMunIxAk] ON [cep].[cepsMunicipios]([munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsMunicipios') AND name='cepMunIxAk')
    PRINT '<<< CREATED INDEX cep.cepsMunicipios.cepMunIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.cepsMunicipios.cepMunIxAk >>>'
go

/* 
 * INDEX: [cepMunIxFkMun] 
 */

CREATE INDEX [cepMunIxFkMun] ON [cep].[cepsMunicipios]([munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsMunicipios') AND name='cepMunIxFkMun')
    PRINT '<<< CREATED INDEX cep.cepsMunicipios.cepMunIxFkMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.cepsMunicipios.cepMunIxFkMun >>>'
go

/* 
 * INDEX: [munFkCepMun] 
 */

CREATE INDEX [munFkCepMun] ON [cep].[cepsMunicipios]([munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsMunicipios') AND name='munFkCepMun')
    PRINT '<<< CREATED INDEX cep.cepsMunicipios.munFkCepMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.cepsMunicipios.munFkCepMun >>>'
go

/* 
 * INDEX: [cepFkCepMun] 
 */

CREATE INDEX [cepFkCepMun] ON [cep].[cepsMunicipios]([cepID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsMunicipios') AND name='cepFkCepMun')
    PRINT '<<< CREATED INDEX cep.cepsMunicipios.cepFkCepMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.cepsMunicipios.cepFkCepMun >>>'
go

