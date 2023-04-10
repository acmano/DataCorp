/* 
 * PROCEDURE: [ibge.regioesIntermediariasUnidadeFederacaoProSel] 
 */

CREATE PROCEDURE [ibge.regioesIntermediariasUnidadeFederacaoProSel]
(
    @regIntUniFedID     int)
AS
BEGIN
    SELECT [regIntUniFedID],
           [uniFedID],
           [regIntID]
      FROM [ibge].[regioesIntermediariasUnidadeFederacao]
     WHERE [regIntUniFedID] = @regIntUniFedID

    RETURN(0)
END
go
IF OBJECT_ID('ibge.regioesIntermediariasUnidadeFederacaoProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.regioesIntermediariasUnidadeFederacaoProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.regioesIntermediariasUnidadeFederacaoProSel >>>'
go


