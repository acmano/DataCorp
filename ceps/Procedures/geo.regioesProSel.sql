/* 
 * PROCEDURE: [geo.regioesProSel] 
 */

CREATE PROCEDURE [geo.regioesProSel]
(
    @regID     int)
AS
BEGIN
    SELECT [regID],
           [nome]
      FROM [geo].[regioes]
     WHERE [regID] = @regID

    RETURN(0)
END
go
IF OBJECT_ID('geo.regioesProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.regioesProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.regioesProSel >>>'
go


