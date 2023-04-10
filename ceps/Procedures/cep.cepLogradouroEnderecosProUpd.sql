/* 
 * PROCEDURE: [cep.cepLogradouroEnderecosProUpd] 
 */

CREATE PROCEDURE [cep.cepLogradouroEnderecosProUpd]
(
    @cepEndID     int,
    @endID        int,
    @cepLogID     int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [cep].[cepLogradouroEnderecos]
       SET [endID]       = @endID,
           [cepLogID]    = @cepLogID
     WHERE [cepEndID] = @cepEndID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[cep.cepLogradouroEnderecosProUpd]: Cannot update  in [cep].[cepLogradouroEnderecos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.cepLogradouroEnderecosProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.cepLogradouroEnderecosProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.cepLogradouroEnderecosProUpd >>>'
go


