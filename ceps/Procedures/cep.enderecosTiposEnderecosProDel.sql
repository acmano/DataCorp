/* 
 * PROCEDURE: [cep.enderecosTiposEnderecosProDel] 
 */

CREATE PROCEDURE [cep.enderecosTiposEnderecosProDel]
(
    @endTipEndID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [cep].[enderecosTiposEnderecos]
     WHERE [endTipEndID] = @endTipEndID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[cep.enderecosTiposEnderecosProDel]: Cannot delete because foreign keys still exist in [cep].[enderecosTiposEnderecos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.enderecosTiposEnderecosProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.enderecosTiposEnderecosProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.enderecosTiposEnderecosProDel >>>'
go


