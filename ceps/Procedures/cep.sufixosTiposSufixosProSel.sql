/* 
 * PROCEDURE: [cep.sufixosTiposSufixosProSel] 
 */

CREATE PROCEDURE [cep.sufixosTiposSufixosProSel]
(
    @sufTipSufID     int)
AS
BEGIN
    SELECT [sufTipSufID],
           [sufTipID],
           [sufID]
      FROM [cep].[sufixosTiposSufixos]
     WHERE [sufTipSufID] = @sufTipSufID

    RETURN(0)
END
go
IF OBJECT_ID('cep.sufixosTiposSufixosProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.sufixosTiposSufixosProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.sufixosTiposSufixosProSel >>>'
go


