/* 
 * PROCEDURE: [geo.nacoesMundosProSel] 
 */

CREATE PROCEDURE [geo.nacoesMundosProSel]
(
    @nacMunID     int)
AS
BEGIN
    SELECT [nacMunID],
           [nacID],
           [munID]
      FROM [geo].[nacoesMundos]
     WHERE [nacMunID] = @nacMunID

    RETURN(0)
END
go
IF OBJECT_ID('geo.nacoesMundosProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.nacoesMundosProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.nacoesMundosProSel >>>'
go


