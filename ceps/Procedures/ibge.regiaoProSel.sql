/* 
 * PROCEDURE: [ibge.regiaoProSel] 
 */

CREATE PROCEDURE [ibge.regiaoProSel]
(
    @regID      int)
AS
BEGIN
    SELECT [regID],
           [codigo],
           [nome],
           [sigla],
           [area]
      FROM [ibge].[regiao]
     WHERE [regID] = @regID

    RETURN(0)
END
go
IF OBJECT_ID('ibge.regiaoProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.regiaoProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.regiaoProSel >>>'
go


