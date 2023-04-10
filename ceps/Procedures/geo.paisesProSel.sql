/* 
 * PROCEDURE: [geo.paisesProSel] 
 */

CREATE PROCEDURE [geo.paisesProSel]
(
    @paiID     int)
AS
BEGIN
    SELECT [paiID],
           [nome]
      FROM [geo].[paises]
     WHERE [paiID] = @paiID

    RETURN(0)
END
go
IF OBJECT_ID('geo.paisesProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.paisesProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.paisesProSel >>>'
go


