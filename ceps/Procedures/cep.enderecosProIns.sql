/* 
 * PROCEDURE: [cep.enderecosProIns] 
 */

CREATE PROCEDURE [cep.enderecosProIns]
(
    @numero          int                     = NULL,
    @complemento     varchar(256)            = NULL,
    @caixaPostal     smallint                = NULL)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [cep].[enderecos]([numero],
                                  [complemento],
                                  [caixaPostal])
    VALUES(@numero,
           @complemento,
           @caixaPostal)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[cep.enderecosProIns]: Cannot insert because primary key value not found in [cep].[enderecos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('cep.enderecosProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.enderecosProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.enderecosProIns >>>'
go


