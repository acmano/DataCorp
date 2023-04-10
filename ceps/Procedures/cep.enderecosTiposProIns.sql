/* 
 * PROCEDURE: [cep.enderecosTiposProIns] 
 */

CREATE PROCEDURE [cep.enderecosTiposProIns]
(
    @codigo       varchar(15),
    @nome         varchar(64))
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [cep].[enderecosTipos]([codigo],
                                       [nome])
    VALUES(@codigo,
           @nome)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[cep.enderecosTiposProIns]: Cannot insert because primary key value not found in [cep].[enderecosTipos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('cep.enderecosTiposProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.enderecosTiposProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.enderecosTiposProIns >>>'
go


