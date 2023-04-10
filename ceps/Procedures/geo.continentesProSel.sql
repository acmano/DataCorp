/* 
 * PROCEDURE: [geo.continentesProSel] 
 */

CREATE PROCEDURE [geo.continentesProSel]
(
    @ctnID     int)
AS
BEGIN
    SELECT [ctnID],
           [nome]
      FROM [geo].[continentes]
     WHERE [ctnID] = @ctnID

    RETURN(0)
END
go
IF OBJECT_ID('geo.continentesProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.continentesProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.continentesProSel >>>'
go


