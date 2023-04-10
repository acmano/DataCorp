/* 
 * PROCEDURE: [ibge.subDistritosMunicipioProDel] 
 */

CREATE PROCEDURE [ibge.subDistritosMunicipioProDel]
(
    @subDisMunID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [ibge].[subDistritosMunicipio]
     WHERE [subDisMunID] = @subDisMunID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[ibge.subDistritosMunicipioProDel]: Cannot delete because foreign keys still exist in [ibge].[subDistritosMunicipio] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.subDistritosMunicipioProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.subDistritosMunicipioProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.subDistritosMunicipioProDel >>>'
go


