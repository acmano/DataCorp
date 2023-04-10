/* 
 * PROCEDURE: [ibge.mesoRegioesUnidadeFederacaoProDel] 
 */

CREATE PROCEDURE [ibge.mesoRegioesUnidadeFederacaoProDel]
(
    @mesRegUniFedID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [ibge].[mesoRegioesUnidadeFederacao]
     WHERE [mesRegUniFedID] = @mesRegUniFedID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[ibge.mesoRegioesUnidadeFederacaoProDel]: Cannot delete because foreign keys still exist in [ibge].[mesoRegioesUnidadeFederacao] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.mesoRegioesUnidadeFederacaoProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.mesoRegioesUnidadeFederacaoProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.mesoRegioesUnidadeFederacaoProDel >>>'
go


