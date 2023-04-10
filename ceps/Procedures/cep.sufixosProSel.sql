/* 
 * PROCEDURE: [cep.sufixosProSel] 
 */

CREATE PROCEDURE [cep.sufixosProSel]
(
    @sufID      int)
AS
BEGIN
    SELECT [sufID],
           [codigo],
           [nome]
      FROM [cep].[sufixos]
     WHERE [sufID] = @sufID

    RETURN(0)
END
go
IF OBJECT_ID('cep.sufixosProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.sufixosProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.sufixosProSel >>>'
go


