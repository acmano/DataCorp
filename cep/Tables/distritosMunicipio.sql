IF OBJECT_ID('[distritosMunicipio]') IS NOT NULL
BEGIN
    DROP TABLE [distritosMunicipio]
    PRINT '<<< DROPPED TABLE [distritosMunicipio] >>>'
END
go
/* 
 * TABLE: [distritosMunicipio] 
 */

CREATE TABLE [distritosMunicipio](
    [disMunID]  int    IDENTITY(1,1),
    [munID]     int    NOT NULL,
    [disID]     int    NOT NULL
)
go



IF OBJECT_ID('distritosMunicipio') IS NOT NULL
    PRINT '<<< CREATED TABLE distritosMunicipio >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE distritosMunicipio >>>'
go

/* 
 * TABLE: [distritosMunicipio] 
 */

ALTER TABLE [distritosMunicipio] ADD 
    CONSTRAINT [disMunIxPk] PRIMARY KEY CLUSTERED ([disMunID])
go

IF OBJECT_ID('distritosMunicipio') IS NOT NULL
    PRINT '<<< CREATED TABLE distritosMunicipio >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE distritosMunicipio >>>'
go

/* 
 * INDEX: [disMunIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('distritosMunicipio') AND name='disMunIxAk')
BEGIN
    DROP INDEX [distritosMunicipio].[disMunIxAk]
    PRINT '<<< DROPPED INDEX [distritosMunicipio].[disMunIxAk] >>>'
END
go

/* 
 * INDEX: [disMunIxFkMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('distritosMunicipio') AND name='disMunIxFkMun')
BEGIN
    DROP INDEX [distritosMunicipio].[disMunIxFkMun]
    PRINT '<<< DROPPED INDEX [distritosMunicipio].[disMunIxFkMun] >>>'
END
go

/* 
 * INDEX: [disMunIxFkDis] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('distritosMunicipio') AND name='disMunIxFkDis')
BEGIN
    DROP INDEX [distritosMunicipio].[disMunIxFkDis]
    PRINT '<<< DROPPED INDEX [distritosMunicipio].[disMunIxFkDis] >>>'
END
go

/* 
 * INDEX: [munFkDisMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('distritosMunicipio') AND name='munFkDisMun')
BEGIN
    DROP INDEX [distritosMunicipio].[munFkDisMun]
    PRINT '<<< DROPPED INDEX [distritosMunicipio].[munFkDisMun] >>>'
END
go

/* 
 * INDEX: [disFkDisMun] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('distritosMunicipio') AND name='disFkDisMun')
BEGIN
    DROP INDEX [distritosMunicipio].[disFkDisMun]
    PRINT '<<< DROPPED INDEX [distritosMunicipio].[disFkDisMun] >>>'
END
go

/* 
 * INDEX: [disMunIxAk] 
 */

CREATE UNIQUE INDEX [disMunIxAk] ON [distritosMunicipio]([munID], [disID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('distritosMunicipio') AND name='disMunIxAk')
    PRINT '<<< CREATED INDEX distritosMunicipio.disMunIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX distritosMunicipio.disMunIxAk >>>'
go

/* 
 * INDEX: [disMunIxFkMun] 
 */

CREATE INDEX [disMunIxFkMun] ON [distritosMunicipio]([munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('distritosMunicipio') AND name='disMunIxFkMun')
    PRINT '<<< CREATED INDEX distritosMunicipio.disMunIxFkMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX distritosMunicipio.disMunIxFkMun >>>'
go

/* 
 * INDEX: [disMunIxFkDis] 
 */

CREATE INDEX [disMunIxFkDis] ON [distritosMunicipio]([disID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('distritosMunicipio') AND name='disMunIxFkDis')
    PRINT '<<< CREATED INDEX distritosMunicipio.disMunIxFkDis >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX distritosMunicipio.disMunIxFkDis >>>'
go

/* 
 * INDEX: [munFkDisMun] 
 */

CREATE INDEX [munFkDisMun] ON [distritosMunicipio]([munID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('distritosMunicipio') AND name='munFkDisMun')
    PRINT '<<< CREATED INDEX distritosMunicipio.munFkDisMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX distritosMunicipio.munFkDisMun >>>'
go

/* 
 * INDEX: [disFkDisMun] 
 */

CREATE INDEX [disFkDisMun] ON [distritosMunicipio]([disID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('distritosMunicipio') AND name='disFkDisMun')
    PRINT '<<< CREATED INDEX distritosMunicipio.disFkDisMun >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX distritosMunicipio.disFkDisMun >>>'
go

