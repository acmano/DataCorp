/* 
 * PROCEDURE: [cep.regioes1ProUpd] 
 */

CREATE PROCEDURE [cep.regioes1ProUpd]
(
    @regID         int,
    @codigo        char(2),
    @nome          varchar(64),
    @cobertura     varchar(64))
AS
BEGIN
    BEGIN TRAN

    UPDATE [cep].[regioes]
       SET [codigo]       = @codigo,
           [nome]         = @nome,
           [cobertura]    = @cobertura
     WHERE [regID] = @regID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[cep.regioes1ProUpd]: Cannot update  in [cep].[regioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.regioes1ProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.regioes1ProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.regioes1ProUpd >>>'
go


