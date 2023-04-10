/* 
 * PROCEDURE: [cep.cepsSubDistritosProSel] 
 */

CREATE PROCEDURE [cep.cepsSubDistritosProSel]
(
    @cepSubDisID     int)
AS
BEGIN
    SELECT [cepSubDisID],
           [subDisID],
           [cepID]
      FROM [cep].[cepsSubDistritos]
     WHERE [cepSubDisID] = @cepSubDisID

    RETURN(0)
END
go
IF OBJECT_ID('cep.cepsSubDistritosProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.cepsSubDistritosProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.cepsSubDistritosProSel >>>'
go


