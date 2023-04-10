/* 
 * PROCEDURE: [ibge.regioesImediatasRegiaoIntermediariaProDel] 
 */

CREATE PROCEDURE [ibge.regioesImediatasRegiaoIntermediariaProDel]
(
    @regImeRegIntID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [ibge].[regioesImediatasRegiaoIntermediaria]
     WHERE [regImeRegIntID] = @regImeRegIntID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[ibge.regioesImediatasRegiaoIntermediariaProDel]: Cannot delete because foreign keys still exist in [ibge].[regioesImediatasRegiaoIntermediaria] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.regioesImediatasRegiaoIntermediariaProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.regioesImediatasRegiaoIntermediariaProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.regioesImediatasRegiaoIntermediariaProDel >>>'
go


