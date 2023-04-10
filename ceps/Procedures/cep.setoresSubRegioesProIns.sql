/* 
 * PROCEDURE: [cep.setoresSubRegioesProIns] 
 */

CREATE PROCEDURE [cep.setoresSubRegioesProIns]
(
    @subRegID        int,
    @setID           int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [cep].[setoresSubRegioes]([subRegID],
                                          [setID])
    VALUES(@subRegID,
           @setID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[cep.setoresSubRegioesProIns]: Cannot insert because primary key value not found in [cep].[setoresSubRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('cep.setoresSubRegioesProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.setoresSubRegioesProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.setoresSubRegioesProIns >>>'
go


