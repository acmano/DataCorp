/* 
 * PROCEDURE: [cep.setoresSubRegioesProSel] 
 */

CREATE PROCEDURE [cep.setoresSubRegioesProSel]
(
    @setSubRegID     int)
AS
BEGIN
    SELECT [setSubRegID],
           [subRegID],
           [setID]
      FROM [cep].[setoresSubRegioes]
     WHERE [setSubRegID] = @setSubRegID

    RETURN(0)
END
go
IF OBJECT_ID('cep.setoresSubRegioesProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.setoresSubRegioesProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.setoresSubRegioesProSel >>>'
go


