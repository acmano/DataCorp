/* 
 * PROCEDURE: [geo.subRegioesRegioesProSel] 
 */

CREATE PROCEDURE [geo.subRegioesRegioesProSel]
(
    @subRegRegID     int)
AS
BEGIN
    SELECT [subRegRegID],
           [regID],
           [subRegID]
      FROM [geo].[subRegioesRegioes]
     WHERE [subRegRegID] = @subRegRegID

    RETURN(0)
END
go
IF OBJECT_ID('geo.subRegioesRegioesProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.subRegioesRegioesProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.subRegioesRegioesProSel >>>'
go


