/* 
 * PROCEDURE: [cep.sufixosTiposProSel] 
 */

CREATE PROCEDURE [cep.sufixosTiposProSel]
(
    @sufTipID     int)
AS
BEGIN
    SELECT [sufTipID],
           [codigo],
           [nome]
      FROM [cep].[sufixosTipos]
     WHERE [sufTipID] = @sufTipID

    RETURN(0)
END
go
IF OBJECT_ID('cep.sufixosTiposProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.sufixosTiposProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.sufixosTiposProSel >>>'
go


