/* 
 * PROCEDURE: [geo.nacoesProSel] 
 */

CREATE PROCEDURE [geo.nacoesProSel]
(
    @nacID         int)
AS
BEGIN
    SELECT [nacID],
           [m49],
           [isoAlpha2],
           [isoAlpha3],
           [latitude],
           [longitude]
      FROM [geo].[nacoes]
     WHERE [nacID] = @nacID

    RETURN(0)
END
go
IF OBJECT_ID('geo.nacoesProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.nacoesProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.nacoesProSel >>>'
go


