/* 
 * PROCEDURE: [cep.enderecosTiposEnderecosProUpd] 
 */

CREATE PROCEDURE [cep.enderecosTiposEnderecosProUpd]
(
    @endTipEndID     int,
    @endTipID        int,
    @endID           int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [cep].[enderecosTiposEnderecos]
       SET [endTipID]       = @endTipID,
           [endID]          = @endID
     WHERE [endTipEndID] = @endTipEndID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[cep.enderecosTiposEnderecosProUpd]: Cannot update  in [cep].[enderecosTiposEnderecos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.enderecosTiposEnderecosProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.enderecosTiposEnderecosProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.enderecosTiposEnderecosProUpd >>>'
go


