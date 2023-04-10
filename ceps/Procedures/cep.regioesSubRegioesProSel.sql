/* 
 * PROCEDURE: [cep.regioesSubRegioesProSel] 
 */

CREATE PROCEDURE [cep.regioesSubRegioesProSel]
(
    @regSubRegID     int)
AS
BEGIN
    SELECT [regSubRegID],
           [regID],
           [subRegID]
      FROM [cep].[regioesSubRegioes]
     WHERE [regSubRegID] = @regSubRegID

    RETURN(0)
END
go
IF OBJECT_ID('cep.regioesSubRegioesProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.regioesSubRegioesProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.regioesSubRegioesProSel >>>'
go


