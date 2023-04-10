/* 
 * PROCEDURE: [ibge.mesoRegioesUnidadeFederacaoProUpd] 
 */

CREATE PROCEDURE [ibge.mesoRegioesUnidadeFederacaoProUpd]
(
    @mesRegUniFedID     int,
    @uniFedID           int,
    @mesRegID           int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [ibge].[mesoRegioesUnidadeFederacao]
       SET [uniFedID]          = @uniFedID,
           [mesRegID]          = @mesRegID
     WHERE [mesRegUniFedID] = @mesRegUniFedID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[ibge.mesoRegioesUnidadeFederacaoProUpd]: Cannot update  in [ibge].[mesoRegioesUnidadeFederacao] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.mesoRegioesUnidadeFederacaoProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.mesoRegioesUnidadeFederacaoProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.mesoRegioesUnidadeFederacaoProUpd >>>'
go


