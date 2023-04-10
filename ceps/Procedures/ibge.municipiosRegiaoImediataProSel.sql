/* 
 * PROCEDURE: [ibge.municipiosRegiaoImediataProSel] 
 */

CREATE PROCEDURE [ibge.municipiosRegiaoImediataProSel]
(
    @munRegImeID     int)
AS
BEGIN
    SELECT [munRegImeID],
           [regImeID],
           [munID]
      FROM [ibge].[municipiosRegiaoImediata]
     WHERE [munRegImeID] = @munRegImeID

    RETURN(0)
END
go
IF OBJECT_ID('ibge.municipiosRegiaoImediataProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.municipiosRegiaoImediataProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.municipiosRegiaoImediataProSel >>>'
go


