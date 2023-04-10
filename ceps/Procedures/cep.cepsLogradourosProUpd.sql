/* 
 * PROCEDURE: [cep.cepsLogradourosProUpd] 
 */

CREATE PROCEDURE [cep.cepsLogradourosProUpd]
(
    @cepLogID        int,
    @cepID           int,
    @logTipLogID     int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [cep].[cepsLogradouros]
       SET [cepID]          = @cepID,
           [logTipLogID]    = @logTipLogID
     WHERE [cepLogID] = @cepLogID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[cep.cepsLogradourosProUpd]: Cannot update  in [cep].[cepsLogradouros] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.cepsLogradourosProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.cepsLogradourosProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.cepsLogradourosProUpd >>>'
go


