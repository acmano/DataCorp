/* 
 * PROCEDURE: [cep.logradouroTipoLogradouroProSel] 
 */

CREATE PROCEDURE [cep.logradouroTipoLogradouroProSel]
(
    @logTipLogID     int)
AS
BEGIN
    SELECT [logTipLogID],
           [logTipID],
           [logID]
      FROM [cep].[logradouroTipoLogradouro]
     WHERE [logTipLogID] = @logTipLogID

    RETURN(0)
END
go
IF OBJECT_ID('cep.logradouroTipoLogradouroProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.logradouroTipoLogradouroProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.logradouroTipoLogradouroProSel >>>'
go


