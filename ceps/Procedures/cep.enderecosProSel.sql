/* 
 * PROCEDURE: [cep.enderecosProSel] 
 */

CREATE PROCEDURE [cep.enderecosProSel]
(
    @endID           int)
AS
BEGIN
    SELECT [endID],
           [numero],
           [complemento],
           [caixaPostal]
      FROM [cep].[enderecos]
     WHERE [endID] = @endID

    RETURN(0)
END
go
IF OBJECT_ID('cep.enderecosProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.enderecosProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.enderecosProSel >>>'
go


