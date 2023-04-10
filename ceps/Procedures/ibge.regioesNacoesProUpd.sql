/* 
 * PROCEDURE: [ibge.regioesNacoesProUpd] 
 */

CREATE PROCEDURE [ibge.regioesNacoesProUpd]
(
    @regNacID     int,
    @nacID        int,
    @regID        int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [ibge].[regioesNacoes]
       SET [nacID]       = @nacID,
           [regID]       = @regID
     WHERE [regNacID] = @regNacID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[ibge.regioesNacoesProUpd]: Cannot update  in [ibge].[regioesNacoes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.regioesNacoesProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.regioesNacoesProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.regioesNacoesProUpd >>>'
go


