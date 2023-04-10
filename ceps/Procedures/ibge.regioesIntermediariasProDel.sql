/* 
 * PROCEDURE: [ibge.regioesIntermediariasProDel] 
 */

CREATE PROCEDURE [ibge.regioesIntermediariasProDel]
(
    @regIntID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [ibge].[regioesIntermediarias]
     WHERE [regIntID] = @regIntID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[ibge.regioesIntermediariasProDel]: Cannot delete because foreign keys still exist in [ibge].[regioesIntermediarias] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.regioesIntermediariasProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.regioesIntermediariasProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.regioesIntermediariasProDel >>>'
go


