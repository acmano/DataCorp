/* 
 * PROCEDURE: [cep.setoresProUpd] 
 */

CREATE PROCEDURE [cep.setoresProUpd]
(
    @setID      int,
    @codigo     char(3),
    @nome       varchar(64))
AS
BEGIN
    BEGIN TRAN

    UPDATE [cep].[setores]
       SET [codigo]    = @codigo,
           [nome]      = @nome
     WHERE [setID] = @setID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[cep.setoresProUpd]: Cannot update  in [cep].[setores] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.setoresProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.setoresProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.setoresProUpd >>>'
go


