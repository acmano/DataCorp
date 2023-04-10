/* 
 * PROCEDURE: [ibge.mesoRegioesUnidadeFederacaoProIns] 
 */

CREATE PROCEDURE [ibge.mesoRegioesUnidadeFederacaoProIns]
(
    @uniFedID           int,
    @mesRegID           int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [ibge].[mesoRegioesUnidadeFederacao]([uniFedID],
                                                     [mesRegID])
    VALUES(@uniFedID,
           @mesRegID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[ibge.mesoRegioesUnidadeFederacaoProIns]: Cannot insert because primary key value not found in [ibge].[mesoRegioesUnidadeFederacao] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('ibge.mesoRegioesUnidadeFederacaoProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.mesoRegioesUnidadeFederacaoProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.mesoRegioesUnidadeFederacaoProIns >>>'
go


