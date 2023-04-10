/* 
 * PROCEDURE: [ibge.unidadesFederacaoProDel] 
 */

CREATE PROCEDURE [ibge.unidadesFederacaoProDel]
(
    @uniFedID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [ibge].[unidadesFederacao]
     WHERE [uniFedID] = @uniFedID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[ibge.unidadesFederacaoProDel]: Cannot delete because foreign keys still exist in [ibge].[unidadesFederacao] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.unidadesFederacaoProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.unidadesFederacaoProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.unidadesFederacaoProDel >>>'
go


