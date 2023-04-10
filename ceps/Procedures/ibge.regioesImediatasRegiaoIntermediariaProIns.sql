/* 
 * PROCEDURE: [ibge.regioesImediatasRegiaoIntermediariaProIns] 
 */

CREATE PROCEDURE [ibge.regioesImediatasRegiaoIntermediariaProIns]
(
    @regIntID           int,
    @regImeID           int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [ibge].[regioesImediatasRegiaoIntermediaria]([regIntID],
                                                             [regImeID])
    VALUES(@regIntID,
           @regImeID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[ibge.regioesImediatasRegiaoIntermediariaProIns]: Cannot insert because primary key value not found in [ibge].[regioesImediatasRegiaoIntermediaria] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('ibge.regioesImediatasRegiaoIntermediariaProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.regioesImediatasRegiaoIntermediariaProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.regioesImediatasRegiaoIntermediariaProIns >>>'
go


