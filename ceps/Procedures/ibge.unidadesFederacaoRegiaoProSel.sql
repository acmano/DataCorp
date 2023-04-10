/* 
 * PROCEDURE: [ibge.unidadesFederacaoRegiaoProSel] 
 */

CREATE PROCEDURE [ibge.unidadesFederacaoRegiaoProSel]
(
    @uniFedRegID     int)
AS
BEGIN
    SELECT [uniFedRegID],
           [regID],
           [uniFedID]
      FROM [ibge].[unidadesFederacaoRegiao]
     WHERE [uniFedRegID] = @uniFedRegID

    RETURN(0)
END
go
IF OBJECT_ID('ibge.unidadesFederacaoRegiaoProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.unidadesFederacaoRegiaoProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.unidadesFederacaoRegiaoProSel >>>'
go


