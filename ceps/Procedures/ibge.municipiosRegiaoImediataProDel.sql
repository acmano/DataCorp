/* 
 * PROCEDURE: [ibge.municipiosRegiaoImediataProDel] 
 */

CREATE PROCEDURE [ibge.municipiosRegiaoImediataProDel]
(
    @munRegImeID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [ibge].[municipiosRegiaoImediata]
     WHERE [munRegImeID] = @munRegImeID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[ibge.municipiosRegiaoImediataProDel]: Cannot delete because foreign keys still exist in [ibge].[municipiosRegiaoImediata] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.municipiosRegiaoImediataProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.municipiosRegiaoImediataProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.municipiosRegiaoImediataProDel >>>'
go


