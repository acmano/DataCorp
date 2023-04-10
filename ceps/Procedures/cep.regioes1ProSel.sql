/* 
 * PROCEDURE: [cep.regioes1ProSel] 
 */

CREATE PROCEDURE [cep.regioes1ProSel]
(
    @regID         int)
AS
BEGIN
    SELECT [regID],
           [codigo],
           [nome],
           [cobertura]
      FROM [cep].[regioes]
     WHERE [regID] = @regID

    RETURN(0)
END
go
IF OBJECT_ID('cep.regioes1ProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.regioes1ProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.regioes1ProSel >>>'
go


