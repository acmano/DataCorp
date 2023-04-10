/* 
 * PROCEDURE: [cep.logradourosProIns] 
 */

CREATE PROCEDURE [cep.logradourosProIns]
(
    @nome             varchar(64),
    @nomeReduzido     varchar(20))
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [cep].[logradouros]([nome],
                                    [nomeReduzido])
    VALUES(@nome,
           @nomeReduzido)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[cep.logradourosProIns]: Cannot insert because primary key value not found in [cep].[logradouros] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('cep.logradourosProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.logradourosProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.logradourosProIns >>>'
go


