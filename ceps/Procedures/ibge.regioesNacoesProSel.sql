/* 
 * PROCEDURE: [ibge.regioesNacoesProSel] 
 */

CREATE PROCEDURE [ibge.regioesNacoesProSel]
(
    @regNacID     int)
AS
BEGIN
    SELECT [regNacID],
           [nacID],
           [regID]
      FROM [ibge].[regioesNacoes]
     WHERE [regNacID] = @regNacID

    RETURN(0)
END
go
IF OBJECT_ID('ibge.regioesNacoesProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.regioesNacoesProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.regioesNacoesProSel >>>'
go


