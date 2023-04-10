/* 
 * PROCEDURE: [ibge.municipiosProDel] 
 */

CREATE PROCEDURE [ibge.municipiosProDel]
(
    @munID      int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [ibge].[municipios]
     WHERE [munID] = @munID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[ibge.municipiosProDel]: Cannot delete because foreign keys still exist in [ibge].[municipios] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.municipiosProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.municipiosProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.municipiosProDel >>>'
go


