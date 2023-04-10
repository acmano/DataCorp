/* 
 * PROCEDURE: [ibge.regioesImediatasProDel] 
 */

CREATE PROCEDURE [ibge.regioesImediatasProDel]
(
    @regImeID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [ibge].[regioesImediatas]
     WHERE [regImeID] = @regImeID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[ibge.regioesImediatasProDel]: Cannot delete because foreign keys still exist in [ibge].[regioesImediatas] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.regioesImediatasProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.regioesImediatasProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.regioesImediatasProDel >>>'
go


