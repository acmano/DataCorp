/* 
 * PROCEDURE: [cep.cepLogradouroEnderecosProIns] 
 */

CREATE PROCEDURE [cep.cepLogradouroEnderecosProIns]
(
    @endID        int,
    @cepLogID     int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [cep].[cepLogradouroEnderecos]([endID],
                                               [cepLogID])
    VALUES(@endID,
           @cepLogID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[cep.cepLogradouroEnderecosProIns]: Cannot insert because primary key value not found in [cep].[cepLogradouroEnderecos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('cep.cepLogradouroEnderecosProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.cepLogradouroEnderecosProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.cepLogradouroEnderecosProIns >>>'
go


