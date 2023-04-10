/* 
 * PROCEDURE: [ibge.unidadesFederacaoRegiaoProUpd] 
 */

CREATE PROCEDURE [ibge.unidadesFederacaoRegiaoProUpd]
(
    @uniFedRegID     int,
    @regID           int,
    @uniFedID        int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [ibge].[unidadesFederacaoRegiao]
       SET [regID]          = @regID,
           [uniFedID]       = @uniFedID
     WHERE [uniFedRegID] = @uniFedRegID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[ibge.unidadesFederacaoRegiaoProUpd]: Cannot update  in [ibge].[unidadesFederacaoRegiao] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.unidadesFederacaoRegiaoProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.unidadesFederacaoRegiaoProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.unidadesFederacaoRegiaoProUpd >>>'
go


