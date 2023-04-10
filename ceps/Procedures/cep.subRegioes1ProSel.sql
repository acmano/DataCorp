/* 
 * PROCEDURE: [cep.subRegioes1ProSel] 
 */

CREATE PROCEDURE [cep.subRegioes1ProSel]
(
    @subRegID     int)
AS
BEGIN
    SELECT [subRegID],
           [codigo],
           [nome]
      FROM [cep].[subRegioes]
     WHERE [subRegID] = @subRegID

    RETURN(0)
END
go
IF OBJECT_ID('cep.subRegioes1ProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.subRegioes1ProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.subRegioes1ProSel >>>'
go


