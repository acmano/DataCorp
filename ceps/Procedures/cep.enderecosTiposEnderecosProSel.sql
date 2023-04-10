/* 
 * PROCEDURE: [cep.enderecosTiposEnderecosProSel] 
 */

CREATE PROCEDURE [cep.enderecosTiposEnderecosProSel]
(
    @endTipEndID     int)
AS
BEGIN
    SELECT [endTipEndID],
           [endTipID],
           [endID]
      FROM [cep].[enderecosTiposEnderecos]
     WHERE [endTipEndID] = @endTipEndID

    RETURN(0)
END
go
IF OBJECT_ID('cep.enderecosTiposEnderecosProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.enderecosTiposEnderecosProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.enderecosTiposEnderecosProSel >>>'
go


