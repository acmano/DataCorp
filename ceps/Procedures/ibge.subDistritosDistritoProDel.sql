/* 
 * PROCEDURE: [ibge.subDistritosDistritoProDel] 
 */

CREATE PROCEDURE [ibge.subDistritosDistritoProDel]
(
    @subDisDisID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [ibge].[subDistritosDistrito]
     WHERE [subDisDisID] = @subDisDisID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[ibge.subDistritosDistritoProDel]: Cannot delete because foreign keys still exist in [ibge].[subDistritosDistrito] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.subDistritosDistritoProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.subDistritosDistritoProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.subDistritosDistritoProDel >>>'
go


