IF OBJECT_ID('[enderecos]') IS NOT NULL
BEGIN
    DROP TABLE [enderecos]
    PRINT '<<< DROPPED TABLE [enderecos] >>>'
END
go
/* 
 * TABLE: [enderecos] 
 */

CREATE TABLE [enderecos](
    [endID]        int             IDENTITY(1,1),
    [numero]       int             NULL,
    [complemento]  varchar(256)    NULL,
    [caixaPostal]  smallint        NULL
)
go



IF OBJECT_ID('enderecos') IS NOT NULL
    PRINT '<<< CREATED TABLE enderecos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE enderecos >>>'
go

/* 
 * TABLE: [enderecos] 
 */

ALTER TABLE [enderecos] ADD 
    CONSTRAINT [endIxPk] PRIMARY KEY CLUSTERED ([endID])
go

IF OBJECT_ID('enderecos') IS NOT NULL
    PRINT '<<< CREATED TABLE enderecos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE enderecos >>>'
go

