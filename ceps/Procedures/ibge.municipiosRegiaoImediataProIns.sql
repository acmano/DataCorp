/* 
 * PROCEDURE: [ibge.municipiosRegiaoImediataProIns] 
 */

CREATE PROCEDURE [ibge.municipiosRegiaoImediataProIns]
(
    @regImeID        int,
    @munID           int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [ibge].[municipiosRegiaoImediata]([regImeID],
                                                  [munID])
    VALUES(@regImeID,
           @munID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[ibge.municipiosRegiaoImediataProIns]: Cannot insert because primary key value not found in [ibge].[municipiosRegiaoImediata] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('ibge.municipiosRegiaoImediataProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.municipiosRegiaoImediataProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.municipiosRegiaoImediataProIns >>>'
go


