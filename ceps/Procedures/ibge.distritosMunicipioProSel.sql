/* 
 * PROCEDURE: [ibge.distritosMunicipioProSel] 
 */

CREATE PROCEDURE [ibge.distritosMunicipioProSel]
(
    @disMunID     int)
AS
BEGIN
    SELECT [disMunID],
           [munID],
           [disID]
      FROM [ibge].[distritosMunicipio]
     WHERE [disMunID] = @disMunID

    RETURN(0)
END
go
IF OBJECT_ID('ibge.distritosMunicipioProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.distritosMunicipioProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.distritosMunicipioProSel >>>'
go


