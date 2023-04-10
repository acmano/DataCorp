/* 
 * PROCEDURE: [cep.cepLogradouroEnderecosProDel] 
 */

CREATE PROCEDURE [cep.cepLogradouroEnderecosProDel]
(
    @cepEndID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [cep].[cepLogradouroEnderecos]
     WHERE [cepEndID] = @cepEndID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[cep.cepLogradouroEnderecosProDel]: Cannot delete because foreign keys still exist in [cep].[cepLogradouroEnderecos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.cepLogradouroEnderecosProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.cepLogradouroEnderecosProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.cepLogradouroEnderecosProDel >>>'
go


