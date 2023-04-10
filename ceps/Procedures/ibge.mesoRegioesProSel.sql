/* 
 * PROCEDURE: [ibge.mesoRegioesProSel] 
 */

CREATE PROCEDURE [ibge.mesoRegioesProSel]
(
    @mesRegID     int)
AS
BEGIN
    SELECT [mesRegID],
           [codigo],
           [nome],
           [area]
      FROM [ibge].[mesoRegioes]
     WHERE [mesRegID] = @mesRegID

    RETURN(0)
END
go
IF OBJECT_ID('ibge.mesoRegioesProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.mesoRegioesProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.mesoRegioesProSel >>>'
go


