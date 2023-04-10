/* 
 * PROCEDURE: [ibge.subDistritosDistritoProIns] 
 */

CREATE PROCEDURE [ibge.subDistritosDistritoProIns]
(
    @disID           int,
    @subDisID        int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [ibge].[subDistritosDistrito]([disID],
                                              [subDisID])
    VALUES(@disID,
           @subDisID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[ibge.subDistritosDistritoProIns]: Cannot insert because primary key value not found in [ibge].[subDistritosDistrito] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('ibge.subDistritosDistritoProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.subDistritosDistritoProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.subDistritosDistritoProIns >>>'
go


