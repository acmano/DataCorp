/* 
 * PROCEDURE: [geo.subRegioesProSel] 
 */

CREATE PROCEDURE [geo.subRegioesProSel]
(
    @subRegID     int)
AS
BEGIN
    SELECT [subRegID],
           [nome]
      FROM [geo].[subRegioes]
     WHERE [subRegID] = @subRegID

    RETURN(0)
END
go
IF OBJECT_ID('geo.subRegioesProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.subRegioesProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.subRegioesProSel >>>'
go


