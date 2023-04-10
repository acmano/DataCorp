/* 
 * PROCEDURE: [ibge.regioesNacoesProIns] 
 */

CREATE PROCEDURE [ibge.regioesNacoesProIns]
(
    @nacID        int,
    @regID        int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [ibge].[regioesNacoes]([nacID],
                                       [regID])
    VALUES(@nacID,
           @regID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[ibge.regioesNacoesProIns]: Cannot insert because primary key value not found in [ibge].[regioesNacoes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('ibge.regioesNacoesProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.regioesNacoesProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.regioesNacoesProIns >>>'
go


