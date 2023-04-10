/* 
 * PROCEDURE: [cep.logradouroTipoLogradouroProIns] 
 */

CREATE PROCEDURE [cep.logradouroTipoLogradouroProIns]
(
    @logTipID        int,
    @logID           int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [cep].[logradouroTipoLogradouro]([logTipID],
                                                 [logID])
    VALUES(@logTipID,
           @logID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[cep.logradouroTipoLogradouroProIns]: Cannot insert because primary key value not found in [cep].[logradouroTipoLogradouro] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('cep.logradouroTipoLogradouroProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.logradouroTipoLogradouroProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.logradouroTipoLogradouroProIns >>>'
go


