/* 
 * PROCEDURE: [ibge.regioesIntermediariasUnidadeFederacaoProUpd] 
 */

CREATE PROCEDURE [ibge.regioesIntermediariasUnidadeFederacaoProUpd]
(
    @regIntUniFedID     int,
    @uniFedID           int,
    @regIntID           int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [ibge].[regioesIntermediariasUnidadeFederacao]
       SET [uniFedID]          = @uniFedID,
           [regIntID]          = @regIntID
     WHERE [regIntUniFedID] = @regIntUniFedID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[ibge.regioesIntermediariasUnidadeFederacaoProUpd]: Cannot update  in [ibge].[regioesIntermediariasUnidadeFederacao] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.regioesIntermediariasUnidadeFederacaoProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.regioesIntermediariasUnidadeFederacaoProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.regioesIntermediariasUnidadeFederacaoProUpd >>>'
go


