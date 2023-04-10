/* 
 * PROCEDURE: [ibge.microRegioesProDel] 
 */

CREATE PROCEDURE [ibge.microRegioesProDel]
(
    @micRegID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [ibge].[microRegioes]
     WHERE [micRegID] = @micRegID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[ibge.microRegioesProDel]: Cannot delete because foreign keys still exist in [ibge].[microRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.microRegioesProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.microRegioesProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.microRegioesProDel >>>'
go


