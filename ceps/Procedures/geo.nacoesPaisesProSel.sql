/* 
 * PROCEDURE: [geo.nacoesPaisesProSel] 
 */

CREATE PROCEDURE [geo.nacoesPaisesProSel]
(
    @nacPaiID     int)
AS
BEGIN
    SELECT [nacPaiID],
           [nacID],
           [paiID]
      FROM [geo].[nacoesPaises]
     WHERE [nacPaiID] = @nacPaiID

    RETURN(0)
END
go
IF OBJECT_ID('geo.nacoesPaisesProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.nacoesPaisesProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.nacoesPaisesProSel >>>'
go


