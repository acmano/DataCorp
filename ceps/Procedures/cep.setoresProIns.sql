/* 
 * PROCEDURE: [cep.setoresProIns] 
 */

CREATE PROCEDURE [cep.setoresProIns]
(
    @codigo     char(3),
    @nome       varchar(64))
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [cep].[setores]([codigo],
                                [nome])
    VALUES(@codigo,
           @nome)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[cep.setoresProIns]: Cannot insert because primary key value not found in [cep].[setores] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('cep.setoresProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.setoresProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.setoresProIns >>>'
go


