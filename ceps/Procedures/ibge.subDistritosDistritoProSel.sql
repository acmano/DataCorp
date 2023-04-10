/* 
 * PROCEDURE: [ibge.subDistritosDistritoProSel] 
 */

CREATE PROCEDURE [ibge.subDistritosDistritoProSel]
(
    @subDisDisID     int)
AS
BEGIN
    SELECT [subDisDisID],
           [disID],
           [subDisID]
      FROM [ibge].[subDistritosDistrito]
     WHERE [subDisDisID] = @subDisDisID

    RETURN(0)
END
go
IF OBJECT_ID('ibge.subDistritosDistritoProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.subDistritosDistritoProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.subDistritosDistritoProSel >>>'
go


