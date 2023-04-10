/* 
 * PROCEDURE: [cep.logradourosProUpd] 
 */

CREATE PROCEDURE [cep.logradourosProUpd]
(
    @logID            int,
    @nome             varchar(64),
    @nomeReduzido     varchar(20))
AS
BEGIN
    BEGIN TRAN

    UPDATE [cep].[logradouros]
       SET [nome]            = @nome,
           [nomeReduzido]    = @nomeReduzido
     WHERE [logID] = @logID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[cep.logradourosProUpd]: Cannot update  in [cep].[logradouros] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.logradourosProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.logradourosProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.logradourosProUpd >>>'
go


