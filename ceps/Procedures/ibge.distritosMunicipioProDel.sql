/* 
 * PROCEDURE: [ibge.distritosMunicipioProDel] 
 */

CREATE PROCEDURE [ibge.distritosMunicipioProDel]
(
    @disMunID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [ibge].[distritosMunicipio]
     WHERE [disMunID] = @disMunID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[ibge.distritosMunicipioProDel]: Cannot delete because foreign keys still exist in [ibge].[distritosMunicipio] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.distritosMunicipioProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.distritosMunicipioProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.distritosMunicipioProDel >>>'
go


