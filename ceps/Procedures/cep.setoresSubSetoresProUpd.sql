/* 
 * PROCEDURE: [cep.setoresSubSetoresProUpd] 
 */

CREATE PROCEDURE [cep.setoresSubSetoresProUpd]
(
    @setSubSetID     int,
    @setID           int,
    @subSetID        int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [cep].[setoresSubSetores]
       SET [setID]          = @setID,
           [subSetID]       = @subSetID
     WHERE [setSubSetID] = @setSubSetID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[cep.setoresSubSetoresProUpd]: Cannot update  in [cep].[setoresSubSetores] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.setoresSubSetoresProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.setoresSubSetoresProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.setoresSubSetoresProUpd >>>'
go


