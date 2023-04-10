/* 
 * PROCEDURE: [cep.subSetoresProSel] 
 */

CREATE PROCEDURE [cep.subSetoresProSel]
(
    @subSetID     int)
AS
BEGIN
    SELECT [subSetID],
           [codigo],
           [nome]
      FROM [cep].[subSetores]
     WHERE [subSetID] = @subSetID

    RETURN(0)
END
go
IF OBJECT_ID('cep.subSetoresProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.subSetoresProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.subSetoresProSel >>>'
go


