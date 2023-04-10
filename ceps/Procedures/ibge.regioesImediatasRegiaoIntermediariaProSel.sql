/* 
 * PROCEDURE: [ibge.regioesImediatasRegiaoIntermediariaProSel] 
 */

CREATE PROCEDURE [ibge.regioesImediatasRegiaoIntermediariaProSel]
(
    @regImeRegIntID     int)
AS
BEGIN
    SELECT [regImeRegIntID],
           [regIntID],
           [regImeID]
      FROM [ibge].[regioesImediatasRegiaoIntermediaria]
     WHERE [regImeRegIntID] = @regImeRegIntID

    RETURN(0)
END
go
IF OBJECT_ID('ibge.regioesImediatasRegiaoIntermediariaProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.regioesImediatasRegiaoIntermediariaProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.regioesImediatasRegiaoIntermediariaProSel >>>'
go


