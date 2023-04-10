/* 
 * PROCEDURE: [cep.cepsLogradourosProSel] 
 */

CREATE PROCEDURE [cep.cepsLogradourosProSel]
(
    @cepLogID        int)
AS
BEGIN
    SELECT [cepLogID],
           [cepID],
           [logTipLogID]
      FROM [cep].[cepsLogradouros]
     WHERE [cepLogID] = @cepLogID

    RETURN(0)
END
go
IF OBJECT_ID('cep.cepsLogradourosProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.cepsLogradourosProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.cepsLogradourosProSel >>>'
go


