/* 
 * PROCEDURE: [cep.setoresSubRegioesProUpd] 
 */

CREATE PROCEDURE [cep.setoresSubRegioesProUpd]
(
    @setSubRegID     int,
    @subRegID        int,
    @setID           int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [cep].[setoresSubRegioes]
       SET [subRegID]       = @subRegID,
           [setID]          = @setID
     WHERE [setSubRegID] = @setSubRegID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[cep.setoresSubRegioesProUpd]: Cannot update  in [cep].[setoresSubRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.setoresSubRegioesProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.setoresSubRegioesProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.setoresSubRegioesProUpd >>>'
go


