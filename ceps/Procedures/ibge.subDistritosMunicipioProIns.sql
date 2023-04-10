/* 
 * PROCEDURE: [ibge.subDistritosMunicipioProIns] 
 */

CREATE PROCEDURE [ibge.subDistritosMunicipioProIns]
(
    @munID           int,
    @subDisID        int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [ibge].[subDistritosMunicipio]([munID],
                                               [subDisID])
    VALUES(@munID,
           @subDisID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[ibge.subDistritosMunicipioProIns]: Cannot insert because primary key value not found in [ibge].[subDistritosMunicipio] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('ibge.subDistritosMunicipioProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.subDistritosMunicipioProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.subDistritosMunicipioProIns >>>'
go


