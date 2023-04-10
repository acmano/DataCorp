/* 
 * PROCEDURE: [ibge.microRegioesMesoRegiaoProSel] 
 */

CREATE PROCEDURE [ibge.microRegioesMesoRegiaoProSel]
(
    @micRegMesRegID     int)
AS
BEGIN
    SELECT [micRegMesRegID],
           [mesRegID],
           [micRegID]
      FROM [ibge].[microRegioesMesoRegiao]
     WHERE [micRegMesRegID] = @micRegMesRegID

    RETURN(0)
END
go
IF OBJECT_ID('ibge.microRegioesMesoRegiaoProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.microRegioesMesoRegiaoProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.microRegioesMesoRegiaoProSel >>>'
go


