/* 
 * PROCEDURE: [ibge.municipiosProSel] 
 */

CREATE PROCEDURE [ibge.municipiosProSel]
(
    @munID      int)
AS
BEGIN
    SELECT [munID],
           [codigo],
           [nome],
           [area]
      FROM [ibge].[municipios]
     WHERE [munID] = @munID

    RETURN(0)
END
go
IF OBJECT_ID('ibge.municipiosProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.municipiosProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.municipiosProSel >>>'
go


