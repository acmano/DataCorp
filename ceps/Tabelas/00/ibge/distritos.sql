IF OBJECT_ID('[ibge].[distritos]') IS NOT NULL
BEGIN
    DROP TABLE [ibge].[distritos]
    PRINT '<<< DROPPED TABLE [ibge].[distritos] >>>'
END
go
/* 
 * TABLE: [ibge].[distritos] 
 */

CREATE TABLE [ibge].[distritos](
    [disID]           int            IDENTITY(1,1),
    [codigo]          char(2)        NOT NULL,
    [codigoCompleto]  char(9)        NOT NULL,
    [nome]            varchar(64)    NOT NULL
)
go



IF OBJECT_ID('ibge.distritos') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.distritos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.distritos >>>'
go

/* 
 * TABLE: [ibge].[distritos] 
 */

ALTER TABLE [ibge].[distritos] ADD 
    CONSTRAINT [disIxPk] PRIMARY KEY CLUSTERED ([disID])
go

IF OBJECT_ID('ibge.distritos') IS NOT NULL
    PRINT '<<< CREATED TABLE ibge.distritos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ibge.distritos >>>'
go

/* 
 * INDEX: [disIxAk0] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.distritos') AND name='disIxAk0')
BEGIN
    DROP INDEX [ibge].[distritos].[disIxAk0]
    PRINT '<<< DROPPED INDEX [ibge].[distritos].[disIxAk0] >>>'
END
go

/* 
 * INDEX: [disIxAk1] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.distritos') AND name='disIxAk1')
BEGIN
    DROP INDEX [ibge].[distritos].[disIxAk1]
    PRINT '<<< DROPPED INDEX [ibge].[distritos].[disIxAk1] >>>'
END
go

/* 
 * INDEX: [disIxAk0] 
 */

CREATE UNIQUE INDEX [disIxAk0] ON [ibge].[distritos]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.distritos') AND name='disIxAk0')
    PRINT '<<< CREATED INDEX ibge.distritos.disIxAk0 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.distritos.disIxAk0 >>>'
go

/* 
 * INDEX: [disIxAk1] 
 */

CREATE UNIQUE INDEX [disIxAk1] ON [ibge].[distritos]([codigoCompleto])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.distritos') AND name='disIxAk1')
    PRINT '<<< CREATED INDEX ibge.distritos.disIxAk1 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX ibge.distritos.disIxAk1 >>>'
go

