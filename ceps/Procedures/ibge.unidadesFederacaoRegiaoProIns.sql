/* 
 * PROCEDURE: [ibge.unidadesFederacaoRegiaoProIns] 
 */

CREATE PROCEDURE [ibge.unidadesFederacaoRegiaoProIns]
(
    @regID           int,
    @uniFedID        int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [ibge].[unidadesFederacaoRegiao]([regID],
                                                 [uniFedID])
    VALUES(@regID,
           @uniFedID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[ibge.unidadesFederacaoRegiaoProIns]: Cannot insert because primary key value not found in [ibge].[unidadesFederacaoRegiao] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('ibge.unidadesFederacaoRegiaoProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.unidadesFederacaoRegiaoProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.unidadesFederacaoRegiaoProIns >>>'
go


