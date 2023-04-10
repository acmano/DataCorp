/* 
 * PROCEDURE: [cep.setoresProSel] 
 */

CREATE PROCEDURE [cep.setoresProSel]
(
    @setID      int)
AS
BEGIN
    SELECT [setID],
           [codigo],
           [nome]
      FROM [cep].[setores]
     WHERE [setID] = @setID

    RETURN(0)
END
go
IF OBJECT_ID('cep.setoresProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.setoresProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.setoresProSel >>>'
go


