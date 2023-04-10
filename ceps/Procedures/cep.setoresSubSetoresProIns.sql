/* 
 * PROCEDURE: [cep.setoresSubSetoresProIns] 
 */

CREATE PROCEDURE [cep.setoresSubSetoresProIns]
(
    @setID           int,
    @subSetID        int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [cep].[setoresSubSetores]([setID],
                                          [subSetID])
    VALUES(@setID,
           @subSetID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[cep.setoresSubSetoresProIns]: Cannot insert because primary key value not found in [cep].[setoresSubSetores] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('cep.setoresSubSetoresProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.setoresSubSetoresProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.setoresSubSetoresProIns >>>'
go


