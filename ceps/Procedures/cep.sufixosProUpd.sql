/* 
 * PROCEDURE: [cep.sufixosProUpd] 
 */

CREATE PROCEDURE [cep.sufixosProUpd]
(
    @sufID      int,
    @codigo     char(3),
    @nome       varchar(64))
AS
BEGIN
    BEGIN TRAN

    UPDATE [cep].[sufixos]
       SET [codigo]    = @codigo,
           [nome]      = @nome
     WHERE [sufID] = @sufID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[cep.sufixosProUpd]: Cannot update  in [cep].[sufixos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.sufixosProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.sufixosProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.sufixosProUpd >>>'
go


