/* 
 * PROCEDURE: [ibge.distritosMunicipioProIns] 
 */

CREATE PROCEDURE [ibge.distritosMunicipioProIns]
(
    @munID        int,
    @disID        int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [ibge].[distritosMunicipio]([munID],
                                            [disID])
    VALUES(@munID,
           @disID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[ibge.distritosMunicipioProIns]: Cannot insert because primary key value not found in [ibge].[distritosMunicipio] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('ibge.distritosMunicipioProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.distritosMunicipioProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.distritosMunicipioProIns >>>'
go


