IF OBJECT_ID('[subDistritos]') IS NOT NULL
BEGIN
    DROP TABLE [subDistritos]
    PRINT '<<< DROPPED TABLE [subDistritos] >>>'
END
go
/* 
 * TABLE: [subDistritos] 
 */

CREATE TABLE [subDistritos](
    [subDisID]        int            IDENTITY(1,1),
    [codigo]          char(2)        NOT NULL,
    [codigoCompleto]  char(11)       NOT NULL,
    [nome]            varchar(64)    NOT NULL
)
go



IF OBJECT_ID('subDistritos') IS NOT NULL
    PRINT '<<< CREATED TABLE subDistritos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE subDistritos >>>'
go

/* 
 * TABLE: [subDistritos] 
 */

ALTER TABLE [subDistritos] ADD 
    CONSTRAINT [subDisIxPk] PRIMARY KEY CLUSTERED ([subDisID])
go

IF OBJECT_ID('subDistritos') IS NOT NULL
    PRINT '<<< CREATED TABLE subDistritos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE subDistritos >>>'
go

/* 
 * INDEX: [subDisIxAk0] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subDistritos') AND name='subDisIxAk0')
BEGIN
    DROP INDEX [subDistritos].[subDisIxAk0]
    PRINT '<<< DROPPED INDEX [subDistritos].[subDisIxAk0] >>>'
END
go

/* 
 * INDEX: [subDisIxAk1] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subDistritos') AND name='subDisIxAk1')
BEGIN
    DROP INDEX [subDistritos].[subDisIxAk1]
    PRINT '<<< DROPPED INDEX [subDistritos].[subDisIxAk1] >>>'
END
go

/* 
 * INDEX: [subDisIxAk0] 
 */

CREATE UNIQUE INDEX [subDisIxAk0] ON [subDistritos]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subDistritos') AND name='subDisIxAk0')
    PRINT '<<< CREATED INDEX subDistritos.subDisIxAk0 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX subDistritos.subDisIxAk0 >>>'
go

/* 
 * INDEX: [subDisIxAk1] 
 */

CREATE UNIQUE INDEX [subDisIxAk1] ON [subDistritos]([codigoCompleto])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('subDistritos') AND name='subDisIxAk1')
    PRINT '<<< CREATED INDEX subDistritos.subDisIxAk1 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX subDistritos.subDisIxAk1 >>>'
go

