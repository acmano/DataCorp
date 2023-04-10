/* 
 * PROCEDURE: [ibge.municipiosRegiaoImediataProUpd] 
 */

CREATE PROCEDURE [ibge.municipiosRegiaoImediataProUpd]
(
    @munRegImeID     int,
    @regImeID        int,
    @munID           int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [ibge].[municipiosRegiaoImediata]
       SET [regImeID]       = @regImeID,
           [munID]          = @munID
     WHERE [munRegImeID] = @munRegImeID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[ibge.municipiosRegiaoImediataProUpd]: Cannot update  in [ibge].[municipiosRegiaoImediata] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.municipiosRegiaoImediataProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.municipiosRegiaoImediataProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.municipiosRegiaoImediataProUpd >>>'
go


