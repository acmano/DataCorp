/* 
 * PROCEDURE: [geo.mundosProSel] 
 */

CREATE PROCEDURE [geo.mundosProSel]
(
    @munID     int)
AS
BEGIN
    SELECT [munID],
           [nome]
      FROM [geo].[mundos]
     WHERE [munID] = @munID

    RETURN(0)
END
go
IF OBJECT_ID('geo.mundosProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.mundosProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.mundosProSel >>>'
go


