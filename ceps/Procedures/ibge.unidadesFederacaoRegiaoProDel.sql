/* 
 * PROCEDURE: [ibge.unidadesFederacaoRegiaoProDel] 
 */

CREATE PROCEDURE [ibge.unidadesFederacaoRegiaoProDel]
(
    @uniFedRegID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [ibge].[unidadesFederacaoRegiao]
     WHERE [uniFedRegID] = @uniFedRegID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[ibge.unidadesFederacaoRegiaoProDel]: Cannot delete because foreign keys still exist in [ibge].[unidadesFederacaoRegiao] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.unidadesFederacaoRegiaoProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.unidadesFederacaoRegiaoProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.unidadesFederacaoRegiaoProDel >>>'
go


