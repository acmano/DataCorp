IF OBJECT_ID('[ibge].[distritosMunicipio]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[distritosMunicipio]
    PRINT '<<< DROPPED TABLE [ibge].[distritosMunicipio] >>>'
END
go
/* 
 * TABLE: [ibge].[distritosMunicipio] 
 */

CREATE TABLE [ibge].[distritosMunicipio](
    [disMunID]  int    IDENTITY(1,1),
    [munID]     int    NOT NULL,
    [disID]     int    NOT NULL
)
go



IF OBJECT_ID('ibge.distritosMunicipio') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.distritosMunicipio >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.distritosMunicipio >>>'
go

/* 
 * TABLE: [ibge].[distritosMunicipio] 
 */

ALTER TABLE [ibge].[distritosMunicipio] ADD 
    CONSTRAINT [disMunIxPk] PRIMARY KEY CLUSTERED ([disMunID])
go

IF OBJECT_ID('ibge.distritosMunicipio') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.distritosMunicipio >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.distritosMunicipio >>>'
go

/* 
 * INDEX: [disMunIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.distritosMunicipio') AND name='disMunIxAk')
BEGIN
    DROP INDEX [ibge].[distritosMunicipio].[disMunIxAk]
    PRINT '<<< DROPPED INDEX [ibge].[distritosMunicipio].[disMunIxAk] >>>'
END
go

/* 
 * INDEX: [disMunIxFkMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.distritosMunicipio') AND name='disMunIxFkMun')
BEGIN
    DROP INDEX [ibge].[distritosMunicipio].[disMunIxFkMun]
    PRINT '<<< DROPPED INDEX [ibge].[distritosMunicipio].[disMunIxFkMun] >>>'
END
go

/* 
 * INDEX: [disMunIxFkDis] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.distritosMunicipio') AND name='disMunIxFkDis')
BEGIN
    DROP INDEX [ibge].[distritosMunicipio].[disMunIxFkDis]
    PRINT '<<< DROPPED INDEX [ibge].[distritosMunicipio].[disMunIxFkDis] >>>'
END
go

/* 
 * INDEX: [munFkDisMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.distritosMunicipio') AND name='munFkDisMun')
BEGIN
    DROP INDEX [ibge].[distritosMunicipio].[munFkDisMun]
    PRINT '<<< DROPPED INDEX [ibge].[distritosMunicipio].[munFkDisMun] >>>'
END
go

/* 
 * INDEX: [disFkDisMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.distritosMunicipio') AND name='disFkDisMun')
BEGIN
    DROP INDEX [ibge].[distritosMunicipio].[disFkDisMun]
    PRINT '<<< DROPPED INDEX [ibge].[distritosMunicipio].[disFkDisMun] >>>'
END
go

/* 
 * INDEX: [disMunIxAk] 
 */

CREATE UNIQUE INDEX [disMunIxAk] ON [ibge].[distritosMunicipio]([munID], [disID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.distritosMunicipio') AND name='disMunIxAk')
    PRINT '<<< CREATED INDEX ibge.distritosMunicipio.disMunIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.distritosMunicipio.disMunIxAk >>>'
go

/* 
 * INDEX: [disMunIxFkMun] 
 */

CREATE INDEX [disMunIxFkMun] ON [ibge].[distritosMunicipio]([munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.distritosMunicipio') AND name='disMunIxFkMun')
    PRINT '<<< CREATED INDEX ibge.distritosMunicipio.disMunIxFkMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.distritosMunicipio.disMunIxFkMun >>>'
go

/* 
 * INDEX: [disMunIxFkDis] 
 */

CREATE INDEX [disMunIxFkDis] ON [ibge].[distritosMunicipio]([disID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.distritosMunicipio') AND name='disMunIxFkDis')
    PRINT '<<< CREATED INDEX ibge.distritosMunicipio.disMunIxFkDis >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.distritosMunicipio.disMunIxFkDis >>>'
go

/* 
 * INDEX: [munFkDisMun] 
 */

CREATE INDEX [munFkDisMun] ON [ibge].[distritosMunicipio]([munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.distritosMunicipio') AND name='munFkDisMun')
    PRINT '<<< CREATED INDEX ibge.distritosMunicipio.munFkDisMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.distritosMunicipio.munFkDisMun >>>'
go

/* 
 * INDEX: [disFkDisMun] 
 */

CREATE INDEX [disFkDisMun] ON [ibge].[distritosMunicipio]([disID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.distritosMunicipio') AND name='disFkDisMun')
    PRINT '<<< CREATED INDEX ibge.distritosMunicipio.disFkDisMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.distritosMunicipio.disFkDisMun >>>'
go

