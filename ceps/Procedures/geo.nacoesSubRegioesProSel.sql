/* 
 * PROCEDURE: [geo.nacoesSubRegioesProSel] 
 */

CREATE PROCEDURE [geo.nacoesSubRegioesProSel]
(
    @nacSubRegID     int)
AS
BEGIN
    SELECT [nacSubRegID],
           [nacID],
           [subRegID]
      FROM [geo].[nacoesSubRegioes]
     WHERE [nacSubRegID] = @nacSubRegID

    RETURN(0)
END
go
IF OBJECT_ID('geo.nacoesSubRegioesProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.nacoesSubRegioesProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.nacoesSubRegioesProSel >>>'
go


