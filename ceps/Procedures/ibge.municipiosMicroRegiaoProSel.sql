/* 
 * PROCEDURE: [ibge.municipiosMicroRegiaoProSel] 
 */

CREATE PROCEDURE [ibge.municipiosMicroRegiaoProSel]
(
    @munMicRegID     int)
AS
BEGIN
    SELECT [munMicRegID],
           [micRegID],
           [munID]
      FROM [ibge].[municipiosMicroRegiao]
     WHERE [munMicRegID] = @munMicRegID

    RETURN(0)
END
go
IF OBJECT_ID('ibge.municipiosMicroRegiaoProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.municipiosMicroRegiaoProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.municipiosMicroRegiaoProSel >>>'
go


