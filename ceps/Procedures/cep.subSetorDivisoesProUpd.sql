/* 
 * PROCEDURE: [cep.subSetorDivisoesProUpd] 
 */

CREATE PROCEDURE [cep.subSetorDivisoesProUpd]
(
    @subSetDivID     int,
    @codigo          char(5),
    @nome            varchar(64))
AS
BEGIN
    BEGIN TRAN

    UPDATE [cep].[subSetorDivisoes]
       SET [codigo]         = @codigo,
           [nome]           = @nome
     WHERE [subSetDivID] = @subSetDivID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[cep.subSetorDivisoesProUpd]: Cannot update  in [cep].[subSetorDivisoes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.subSetorDivisoesProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.subSetorDivisoesProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.subSetorDivisoesProUpd >>>'
go


