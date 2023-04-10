/* 
 * PROCEDURE: [ibge.regioesIntermediariasUnidadeFederacaoProIns] 
 */

CREATE PROCEDURE [ibge.regioesIntermediariasUnidadeFederacaoProIns]
(
    @uniFedID           int,
    @regIntID           int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [ibge].[regioesIntermediariasUnidadeFederacao]([uniFedID],
                                                               [regIntID])
    VALUES(@uniFedID,
           @regIntID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[ibge.regioesIntermediariasUnidadeFederacaoProIns]: Cannot insert because primary key value not found in [ibge].[regioesIntermediariasUnidadeFederacao] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('ibge.regioesIntermediariasUnidadeFederacaoProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.regioesIntermediariasUnidadeFederacaoProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.regioesIntermediariasUnidadeFederacaoProIns >>>'
go


