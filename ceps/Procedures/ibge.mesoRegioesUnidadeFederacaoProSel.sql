/* 
 * PROCEDURE: [ibge.mesoRegioesUnidadeFederacaoProSel] 
 */

CREATE PROCEDURE [ibge.mesoRegioesUnidadeFederacaoProSel]
(
    @mesRegUniFedID     int)
AS
BEGIN
    SELECT [mesRegUniFedID],
           [uniFedID],
           [mesRegID]
      FROM [ibge].[mesoRegioesUnidadeFederacao]
     WHERE [mesRegUniFedID] = @mesRegUniFedID

    RETURN(0)
END
go
IF OBJECT_ID('ibge.mesoRegioesUnidadeFederacaoProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.mesoRegioesUnidadeFederacaoProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.mesoRegioesUnidadeFederacaoProSel >>>'
go


