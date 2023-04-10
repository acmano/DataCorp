/* 
 * PROCEDURE: [ibge.regioesIntermediariasProSel] 
 */

CREATE PROCEDURE [ibge.regioesIntermediariasProSel]
(
    @regIntID     int)
AS
BEGIN
    SELECT [regIntID],
           [codigo],
           [nome],
           [area]
      FROM [ibge].[regioesIntermediarias]
     WHERE [regIntID] = @regIntID

    RETURN(0)
END
go
IF OBJECT_ID('ibge.regioesIntermediariasProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.regioesIntermediariasProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.regioesIntermediariasProSel >>>'
go


