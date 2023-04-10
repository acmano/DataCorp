/* 
 * PROCEDURE: [cep.cepsMunicipiosProSel] 
 */

CREATE PROCEDURE [cep.cepsMunicipiosProSel]
(
    @cepMunID     int)
AS
BEGIN
    SELECT [cepMunID],
           [munID],
           [cepID]
      FROM [cep].[cepsMunicipios]
     WHERE [cepMunID] = @cepMunID

    RETURN(0)
END
go
IF OBJECT_ID('cep.cepsMunicipiosProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.cepsMunicipiosProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.cepsMunicipiosProSel >>>'
go


