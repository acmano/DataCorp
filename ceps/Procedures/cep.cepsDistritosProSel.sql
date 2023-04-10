/* 
 * PROCEDURE: [cep.cepsDistritosProSel] 
 */

CREATE PROCEDURE [cep.cepsDistritosProSel]
(
    @cepDisID     int)
AS
BEGIN
    SELECT [cepDisID],
           [disID],
           [cepID]
      FROM [cep].[cepsDistritos]
     WHERE [cepDisID] = @cepDisID

    RETURN(0)
END
go
IF OBJECT_ID('cep.cepsDistritosProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.cepsDistritosProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.cepsDistritosProSel >>>'
go


