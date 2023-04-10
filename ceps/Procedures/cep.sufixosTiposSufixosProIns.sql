/* 
 * PROCEDURE: [cep.sufixosTiposSufixosProIns] 
 */

CREATE PROCEDURE [cep.sufixosTiposSufixosProIns]
(
    @sufTipID        int,
    @sufID           int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [cep].[sufixosTiposSufixos]([sufTipID],
                                            [sufID])
    VALUES(@sufTipID,
           @sufID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[cep.sufixosTiposSufixosProIns]: Cannot insert because primary key value not found in [cep].[sufixosTiposSufixos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('cep.sufixosTiposSufixosProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.sufixosTiposSufixosProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.sufixosTiposSufixosProIns >>>'
go


