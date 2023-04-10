IF OBJECT_ID('[distritos]') IS NOT NULL
BEGIN
    DROP TABLE [distritos]
    PRINT '<<< DROPPED TABLE [distritos] >>>'
END
go
/* 
 * TABLE: [distritos] 
 */

CREATE TABLE [distritos](
    [disID]           int            IDENTITY(1,1),
    [codigo]          char(2)        NOT NULL,
    [codigoCompleto]  char(9)        NOT NULL,
    [nome]            varchar(64)    NOT NULL
)
go



IF OBJECT_ID('distritos') IS NOT NULL
    PRINT '<<< CREATED TABLE distritos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE distritos >>>'
go

/* 
 * TABLE: [distritos] 
 */

ALTER TABLE [distritos] ADD 
    CONSTRAINT [disIxPk] PRIMARY KEY CLUSTERED ([disID])
go

IF OBJECT_ID('distritos') IS NOT NULL
    PRINT '<<< CREATED TABLE distritos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE distritos >>>'
go

/* 
 * INDEX: [disIxAk0] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('distritos') AND name='disIxAk0')
BEGIN
    DROP INDEX [distritos].[disIxAk0]
    PRINT '<<< DROPPED INDEX [distritos].[disIxAk0] >>>'
END
go

/* 
 * INDEX: [disIxAk1] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('distritos') AND name='disIxAk1')
BEGIN
    DROP INDEX [distritos].[disIxAk1]
    PRINT '<<< DROPPED INDEX [distritos].[disIxAk1] >>>'
END
go

/* 
 * INDEX: [disIxAk0] 
 */

CREATE UNIQUE INDEX [disIxAk0] ON [distritos]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('distritos') AND name='disIxAk0')
    PRINT '<<< CREATED INDEX distritos.disIxAk0 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX distritos.disIxAk0 >>>'
go

/* 
 * INDEX: [disIxAk1] 
 */

CREATE UNIQUE INDEX [disIxAk1] ON [distritos]([codigoCompleto])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('distritos') AND name='disIxAk1')
    PRINT '<<< CREATED INDEX distritos.disIxAk1 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX distritos.disIxAk1 >>>'
go

