/* 
 * PROCEDURE: [ibge.regioesIntermediariasUnidadeFederacaoProDel] 
 */

CREATE PROCEDURE [ibge.regioesIntermediariasUnidadeFederacaoProDel]
(
    @regIntUniFedID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [ibge].[regioesIntermediariasUnidadeFederacao]
     WHERE [regIntUniFedID] = @regIntUniFedID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[ibge.regioesIntermediariasUnidadeFederacaoProDel]: Cannot delete because foreign keys still exist in [ibge].[regioesIntermediariasUnidadeFederacao] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.regioesIntermediariasUnidadeFederacaoProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.regioesIntermediariasUnidadeFederacaoProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.regioesIntermediariasUnidadeFederacaoProDel >>>'
go


