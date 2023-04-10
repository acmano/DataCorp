/* 
 * PROCEDURE: [cep.setoresSubSetoresProSel] 
 */

CREATE PROCEDURE [cep.setoresSubSetoresProSel]
(
    @setSubSetID     int)
AS
BEGIN
    SELECT [setSubSetID],
           [setID],
           [subSetID]
      FROM [cep].[setoresSubSetores]
     WHERE [setSubSetID] = @setSubSetID

    RETURN(0)
END
go
IF OBJECT_ID('cep.setoresSubSetoresProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.setoresSubSetoresProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.setoresSubSetoresProSel >>>'
go


