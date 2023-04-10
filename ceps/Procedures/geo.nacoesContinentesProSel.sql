/* 
 * PROCEDURE: [geo.nacoesContinentesProSel] 
 */

CREATE PROCEDURE [geo.nacoesContinentesProSel]
(
    @nacCntID     int)
AS
BEGIN
    SELECT [nacCntID],
           [nacID],
           [ctnID]
      FROM [geo].[nacoesContinentes]
     WHERE [nacCntID] = @nacCntID

    RETURN(0)
END
go
IF OBJECT_ID('geo.nacoesContinentesProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.nacoesContinentesProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.nacoesContinentesProSel >>>'
go


