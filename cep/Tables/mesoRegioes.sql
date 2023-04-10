IF OBJECT_ID('[mesoRegioes]') IS NOT NULL
BEGIN
    DROP TABLE [mesoRegioes]
    PRINT '<<< DROPPED TABLE [mesoRegioes] >>>'
END
go
/* 
 * TABLE: [mesoRegioes] 
 */

CREATE TABLE [mesoRegioes](
    [mesRegID]  int               IDENTITY(1,1),
    [codigo]    char(2)           NOT NULL,
    [nome]      varchar(64)       NOT NULL,
    [area]      decimal(10, 3)    NOT NULL
)
go



IF OBJECT_ID('mesoRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE mesoRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE mesoRegioes >>>'
go

/* 
 * TABLE: [mesoRegioes] 
 */

ALTER TABLE [mesoRegioes] ADD 
    CONSTRAINT [mesRegIxPk] PRIMARY KEY CLUSTERED ([mesRegID])
go

IF OBJECT_ID('mesoRegioes') IS NOT NULL
    PRINT '<<< CREATED TABLE mesoRegioes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE mesoRegioes >>>'
go

/* 
 * INDEX: [mesRegIxAK] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('mesoRegioes') AND name='mesRegIxAK')
BEGIN
    DROP INDEX [mesoRegioes].[mesRegIxAK]
    PRINT '<<< DROPPED INDEX [mesoRegioes].[mesRegIxAK] >>>'
END
go

/* 
 * INDEX: [mesRegIxAK] 
 */

CREATE UNIQUE INDEX [mesRegIxAK] ON [mesoRegioes]([codigo])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('mesoRegioes') AND name='mesRegIxAK')
    PRINT '<<< CREATED INDEX mesoRegioes.mesRegIxAK >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX mesoRegioes.mesRegIxAK >>>'
go

