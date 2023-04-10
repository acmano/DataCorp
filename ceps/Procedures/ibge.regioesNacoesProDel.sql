/* 
 * PROCEDURE: [ibge.regioesNacoesProDel] 
 */

CREATE PROCEDURE [ibge.regioesNacoesProDel]
(
    @regNacID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [ibge].[regioesNacoes]
     WHERE [regNacID] = @regNacID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[ibge.regioesNacoesProDel]: Cannot delete because foreign keys still exist in [ibge].[regioesNacoes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.regioesNacoesProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.regioesNacoesProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.regioesNacoesProDel >>>'
go


