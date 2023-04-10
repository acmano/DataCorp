/* 
 * PROCEDURE: [cep.sufixosProIns] 
 */

CREATE PROCEDURE [cep.sufixosProIns]
(
    @codigo     char(3),
    @nome       varchar(64))
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [cep].[sufixos]([codigo],
                                [nome])
    VALUES(@codigo,
           @nome)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[cep.sufixosProIns]: Cannot insert because primary key value not found in [cep].[sufixos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('cep.sufixosProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.sufixosProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.sufixosProIns >>>'
go


