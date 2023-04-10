/* 
 * PROCEDURE: [cep.cepsLogradourosProIns] 
 */

CREATE PROCEDURE [cep.cepsLogradourosProIns]
(
    @cepID           int,
    @logTipLogID     int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [cep].[cepsLogradouros]([cepID],
                                        [logTipLogID])
    VALUES(@cepID,
           @logTipLogID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[cep.cepsLogradourosProIns]: Cannot insert because primary key value not found in [cep].[cepsLogradouros] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('cep.cepsLogradourosProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.cepsLogradourosProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.cepsLogradourosProIns >>>'
go


