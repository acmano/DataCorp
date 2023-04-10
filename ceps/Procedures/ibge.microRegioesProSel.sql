/* 
 * PROCEDURE: [ibge.microRegioesProSel] 
 */

CREATE PROCEDURE [ibge.microRegioesProSel]
(
    @micRegID     int)
AS
BEGIN
    SELECT [micRegID],
           [codigo],
           [nome],
           [area]
      FROM [ibge].[microRegioes]
     WHERE [micRegID] = @micRegID

    RETURN(0)
END
go
IF OBJECT_ID('ibge.microRegioesProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.microRegioesProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.microRegioesProSel >>>'
go


