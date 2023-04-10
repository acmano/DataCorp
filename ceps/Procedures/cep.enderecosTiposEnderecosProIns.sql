/* 
 * PROCEDURE: [cep.enderecosTiposEnderecosProIns] 
 */

CREATE PROCEDURE [cep.enderecosTiposEnderecosProIns]
(
    @endTipID        int,
    @endID           int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [cep].[enderecosTiposEnderecos]([endTipID],
                                                [endID])
    VALUES(@endTipID,
           @endID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[cep.enderecosTiposEnderecosProIns]: Cannot insert because primary key value not found in [cep].[enderecosTiposEnderecos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('cep.enderecosTiposEnderecosProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.enderecosTiposEnderecosProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.enderecosTiposEnderecosProIns >>>'
go


