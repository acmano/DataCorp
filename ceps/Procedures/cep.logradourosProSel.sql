/* 
 * PROCEDURE: [cep.logradourosProSel] 
 */

CREATE PROCEDURE [cep.logradourosProSel]
(
    @logID            int)
AS
BEGIN
    SELECT [logID],
           [nome],
           [nomeReduzido]
      FROM [cep].[logradouros]
     WHERE [logID] = @logID

    RETURN(0)
END
go
IF OBJECT_ID('cep.logradourosProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.logradourosProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.logradourosProSel >>>'
go


