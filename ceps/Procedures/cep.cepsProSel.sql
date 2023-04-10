/* 
 * PROCEDURE: [cep.cepsProSel] 
 */

CREATE PROCEDURE [cep.cepsProSel]
(
    @cepID           int)
AS
BEGIN
    SELECT [cepID],
           [subSetDivID],
           [sufID]
      FROM [cep].[ceps]
     WHERE [cepID] = @cepID

    RETURN(0)
END
go
IF OBJECT_ID('cep.cepsProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.cepsProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.cepsProSel >>>'
go


