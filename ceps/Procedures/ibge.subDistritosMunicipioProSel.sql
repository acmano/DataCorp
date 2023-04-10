/* 
 * PROCEDURE: [ibge.subDistritosMunicipioProSel] 
 */

CREATE PROCEDURE [ibge.subDistritosMunicipioProSel]
(
    @subDisMunID     int)
AS
BEGIN
    SELECT [subDisMunID],
           [munID],
           [subDisID]
      FROM [ibge].[subDistritosMunicipio]
     WHERE [subDisMunID] = @subDisMunID

    RETURN(0)
END
go
IF OBJECT_ID('ibge.subDistritosMunicipioProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.subDistritosMunicipioProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.subDistritosMunicipioProSel >>>'
go


