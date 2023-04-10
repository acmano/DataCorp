/* 
 * PROCEDURE: [cep.sufixosTiposSufixosProUpd] 
 */

CREATE PROCEDURE [cep.sufixosTiposSufixosProUpd]
(
    @sufTipSufID     int,
    @sufTipID        int,
    @sufID           int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [cep].[sufixosTiposSufixos]
       SET [sufTipID]       = @sufTipID,
           [sufID]          = @sufID
     WHERE [sufTipSufID] = @sufTipSufID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[cep.sufixosTiposSufixosProUpd]: Cannot update  in [cep].[sufixosTiposSufixos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.sufixosTiposSufixosProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.sufixosTiposSufixosProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.sufixosTiposSufixosProUpd >>>'
go


