/* 
 * PROCEDURE: [geo.nacoesRegioesProSel] 
 */

CREATE PROCEDURE [geo.nacoesRegioesProSel]
(
    @nacRegID     int)
AS
BEGIN
    SELECT [nacRegID],
           [nacID],
           [regID]
      FROM [geo].[nacoesRegioes]
     WHERE [nacRegID] = @nacRegID

    RETURN(0)
END
go
IF OBJECT_ID('geo.nacoesRegioesProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.nacoesRegioesProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.nacoesRegioesProSel >>>'
go


