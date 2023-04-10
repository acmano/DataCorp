/* 
 * PROCEDURE: [ibge.regioesImediatasRegiaoIntermediariaProUpd] 
 */

CREATE PROCEDURE [ibge.regioesImediatasRegiaoIntermediariaProUpd]
(
    @regImeRegIntID     int,
    @regIntID           int,
    @regImeID           int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [ibge].[regioesImediatasRegiaoIntermediaria]
       SET [regIntID]          = @regIntID,
           [regImeID]          = @regImeID
     WHERE [regImeRegIntID] = @regImeRegIntID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[ibge.regioesImediatasRegiaoIntermediariaProUpd]: Cannot update  in [ibge].[regioesImediatasRegiaoIntermediaria] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.regioesImediatasRegiaoIntermediariaProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.regioesImediatasRegiaoIntermediariaProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.regioesImediatasRegiaoIntermediariaProUpd >>>'
go


