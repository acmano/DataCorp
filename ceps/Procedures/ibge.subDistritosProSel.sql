/* 
 * PROCEDURE: [ibge.subDistritosProSel] 
 */

CREATE PROCEDURE [ibge.subDistritosProSel]
(
    @subDisID           int)
AS
BEGIN
    SELECT [subDisID],
           [codigo],
           [codigoCompleto],
           [nome]
      FROM [ibge].[subDistritos]
     WHERE [subDisID] = @subDisID

    RETURN(0)
END
go
IF OBJECT_ID('ibge.subDistritosProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.subDistritosProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.subDistritosProSel >>>'
go


