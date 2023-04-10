/* 
 * PROCEDURE: [geo.paisesSubRegioesProSel] 
 */

CREATE PROCEDURE [geo.paisesSubRegioesProSel]
(
    @paiSubRegID     int)
AS
BEGIN
    SELECT [paiSubRegID],
           [paiID],
           [subRegID]
      FROM [geo].[paisesSubRegioes]
     WHERE [paiSubRegID] = @paiSubRegID

    RETURN(0)
END
go
IF OBJECT_ID('geo.paisesSubRegioesProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.paisesSubRegioesProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.paisesSubRegioesProSel >>>'
go


