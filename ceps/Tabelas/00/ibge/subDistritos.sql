IF OBJECT_ID('[ibge].[subDistritos]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[subDistritos]
    PRINT '<<< DROPPED TABLE [ibge].[subDistritos] >>>'
END
go
/* 
 * TABLE: [ibge].[subDistritos] 
 */

CREATE TABLE [ibge].[subDistritos](
    [subDisID]        int            IDENTITY(1,1),
    [codigo]          char(2)        NOT NULL,
    [codigoCompleto]  char(11)       NOT NULL,
    [nome]            varchar(64)    NOT NULL
)
go



IF OBJECT_ID('ibge.subDistritos') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.subDistritos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.subDistritos >>>'
go

/* 
 * TABLE: [ibge].[subDistritos] 
 */

ALTER TABLE [ibge].[subDistritos] ADD 
    CONSTRAINT [subDisIxPk] PRIMARY KEY CLUSTERED ([subDisID])
go

IF OBJECT_ID('ibge.subDistritos') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.subDistritos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.subDistritos >>>'
go

/* 
 * INDEX: [subDisIxAk0] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.subDistritos') AND name='subDisIxAk0')
BEGIN
    DROP INDEX [ibge].[subDistritos].[subDisIxAk0]
    PRINT '<<< DROPPED INDEX [ibge].[subDistritos].[subDisIxAk0] >>>'
END
go

/* 
 * INDEX: [subDisIxAk1] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.subDistritos') AND name='subDisIxAk1')
BEGIN
    DROP INDEX [ibge].[subDistritos].[subDisIxAk1]
    PRINT '<<< DROPPED INDEX [ibge].[subDistritos].[subDisIxAk1] >>>'
END
go

/* 
 * INDEX: [subDisIxAk0] 
 */

CREATE UNIQUE INDEX [subDisIxAk0] ON [ibge].[subDistritos]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.subDistritos') AND name='subDisIxAk0')
    PRINT '<<< CREATED INDEX ibge.subDistritos.subDisIxAk0 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.subDistritos.subDisIxAk0 >>>'
go

/* 
 * INDEX: [subDisIxAk1] 
 */

CREATE UNIQUE INDEX [subDisIxAk1] ON [ibge].[subDistritos]([codigoCompleto])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.subDistritos') AND name='subDisIxAk1')
    PRINT '<<< CREATED INDEX ibge.subDistritos.subDisIxAk1 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.subDistritos.subDisIxAk1 >>>'
go

