/* 
 * PROCEDURE: [cep.logradouroTipoProSel] 
 */

CREATE PROCEDURE [cep.logradouroTipoProSel]
(
    @logTipID               int)
AS
BEGIN
    SELECT [logTipID],
           [nome],
           [descricao],
           [descricaoAbreviada]
      FROM [cep].[logradouroTipo]
     WHERE [logTipID] = @logTipID

    RETURN(0)
END
go
IF OBJECT_ID('cep.logradouroTipoProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.logradouroTipoProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.logradouroTipoProSel >>>'
go


