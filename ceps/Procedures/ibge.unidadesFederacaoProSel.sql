/* 
 * PROCEDURE: [ibge.unidadesFederacaoProSel] 
 */

CREATE PROCEDURE [ibge.unidadesFederacaoProSel]
(
    @uniFedID     int)
AS
BEGIN
    SELECT [uniFedID],
           [codigo],
           [sigla],
           [nome],
           [area]
      FROM [ibge].[unidadesFederacao]
     WHERE [uniFedID] = @uniFedID

    RETURN(0)
END
go
IF OBJECT_ID('ibge.unidadesFederacaoProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.unidadesFederacaoProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.unidadesFederacaoProSel >>>'
go


