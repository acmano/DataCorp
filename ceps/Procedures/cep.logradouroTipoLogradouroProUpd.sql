/* 
 * PROCEDURE: [cep.logradouroTipoLogradouroProUpd] 
 */

CREATE PROCEDURE [cep.logradouroTipoLogradouroProUpd]
(
    @logTipLogID     int,
    @logTipID        int,
    @logID           int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [cep].[logradouroTipoLogradouro]
       SET [logTipID]       = @logTipID,
           [logID]          = @logID
     WHERE [logTipLogID] = @logTipLogID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[cep.logradouroTipoLogradouroProUpd]: Cannot update  in [cep].[logradouroTipoLogradouro] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.logradouroTipoLogradouroProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.logradouroTipoLogradouroProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.logradouroTipoLogradouroProUpd >>>'
go


