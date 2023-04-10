/* 
 * PROCEDURE: [ibge.subDistritosProDel] 
 */

CREATE PROCEDURE [ibge.subDistritosProDel]
(
    @subDisID           int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [ibge].[subDistritos]
     WHERE [subDisID] = @subDisID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[ibge.subDistritosProDel]: Cannot delete because foreign keys still exist in [ibge].[subDistritos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.subDistritosProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.subDistritosProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.subDistritosProDel >>>'
go


