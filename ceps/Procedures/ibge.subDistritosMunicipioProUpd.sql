/* 
 * PROCEDURE: [ibge.subDistritosMunicipioProUpd] 
 */

CREATE PROCEDURE [ibge.subDistritosMunicipioProUpd]
(
    @subDisMunID     int,
    @munID           int,
    @subDisID        int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [ibge].[subDistritosMunicipio]
       SET [munID]          = @munID,
           [subDisID]       = @subDisID
     WHERE [subDisMunID] = @subDisMunID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[ibge.subDistritosMunicipioProUpd]: Cannot update  in [ibge].[subDistritosMunicipio] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.subDistritosMunicipioProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.subDistritosMunicipioProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.subDistritosMunicipioProUpd >>>'
go


