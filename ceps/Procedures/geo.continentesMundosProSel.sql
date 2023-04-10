/* 
 * PROCEDURE: [geo.continentesMundosProSel] 
 */

CREATE PROCEDURE [geo.continentesMundosProSel]
(
    @ctnMunID     int)
AS
BEGIN
    SELECT [ctnMunID],
           [munID],
           [ctnID]
      FROM [geo].[continentesMundos]
     WHERE [ctnMunID] = @ctnMunID

    RETURN(0)
END
go
IF OBJECT_ID('geo.continentesMundosProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.continentesMundosProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.continentesMundosProSel >>>'
go


