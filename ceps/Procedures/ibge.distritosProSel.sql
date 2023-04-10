/* 
 * PROCEDURE: [ibge.distritosProSel] 
 */

CREATE PROCEDURE [ibge.distritosProSel]
(
    @disID              int)
AS
BEGIN
    SELECT [disID],
           [codigo],
           [codigoCompleto],
           [nome]
      FROM [ibge].[distritos]
     WHERE [disID] = @disID

    RETURN(0)
END
go
IF OBJECT_ID('ibge.distritosProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.distritosProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.distritosProSel >>>'
go


