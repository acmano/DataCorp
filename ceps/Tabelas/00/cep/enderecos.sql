IF OBJECT_ID('[cep].[enderecos]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[enderecos]
    PRINT '<<< DROPPED TABLE [cep].[enderecos] >>>'
END
go
/* 
 * TABLE: [cep].[enderecos] 
 */

CREATE TABLE [cep].[enderecos](
    [endID]        int             IDENTITY(1,1),
    [numero]       int             NULL,
    [complemento]  varchar(256)    NULL,
    [caixaPostal]  smallint        NULL
)
go



IF OBJECT_ID('cep.enderecos') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.enderecos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.enderecos >>>'
go

/* 
 * TABLE: [cep].[enderecos] 
 */

ALTER TABLE [cep].[enderecos] ADD 
    CONSTRAINT [endIxPk] PRIMARY KEY CLUSTERED ([endID])
go

IF OBJECT_ID('cep.enderecos') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.enderecos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.enderecos >>>'
go

