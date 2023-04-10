/* 
 * PROCEDURE: [ibge.mesoRegioesProDel] 
 */

CREATE PROCEDURE [ibge.mesoRegioesProDel]
(
    @mesRegID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [ibge].[mesoRegioes]
     WHERE [mesRegID] = @mesRegID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[ibge.mesoRegioesProDel]: Cannot delete because foreign keys still exist in [ibge].[mesoRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.mesoRegioesProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.mesoRegioesProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.mesoRegioesProDel >>>'
go


