/* 
 * PROCEDURE: [cep.cepLogradouroEnderecosProSel] 
 */

CREATE PROCEDURE [cep.cepLogradouroEnderecosProSel]
(
    @cepEndID     int)
AS
BEGIN
    SELECT [cepEndID],
           [endID],
           [cepLogID]
      FROM [cep].[cepLogradouroEnderecos]
     WHERE [cepEndID] = @cepEndID

    RETURN(0)
END
go
IF OBJECT_ID('cep.cepLogradouroEnderecosProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.cepLogradouroEnderecosProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.cepLogradouroEnderecosProSel >>>'
go


