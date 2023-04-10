/* 
 * PROCEDURE: [geo.paisesRegioesProSel] 
 */

CREATE PROCEDURE [geo.paisesRegioesProSel]
(
    @paiRegID     int)
AS
BEGIN
    SELECT [paiRegID],
           [paiID],
           [regID]
      FROM [geo].[paisesRegioes]
     WHERE [paiRegID] = @paiRegID

    RETURN(0)
END
go
IF OBJECT_ID('geo.paisesRegioesProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.paisesRegioesProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.paisesRegioesProSel >>>'
go


