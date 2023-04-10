/* 
 * PROCEDURE: [ibge.regioesImediatasProSel] 
 */

CREATE PROCEDURE [ibge.regioesImediatasProSel]
(
    @regImeID     int)
AS
BEGIN
    SELECT [regImeID],
           [codigo],
           [nome],
           [area]
      FROM [ibge].[regioesImediatas]
     WHERE [regImeID] = @regImeID

    RETURN(0)
END
go
IF OBJECT_ID('ibge.regioesImediatasProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.regioesImediatasProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.regioesImediatasProSel >>>'
go


