/* 
 * PROCEDURE: [ibge.distritosProDel] 
 */

CREATE PROCEDURE [ibge.distritosProDel]
(
    @disID              int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [ibge].[distritos]
     WHERE [disID] = @disID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[ibge.distritosProDel]: Cannot delete because foreign keys still exist in [ibge].[distritos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.distritosProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.distritosProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.distritosProDel >>>'
go


