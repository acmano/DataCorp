/* 
 * PROCEDURE: [cep.subSetoresProUpd] 
 */

CREATE PROCEDURE [cep.subSetoresProUpd]
(
    @subSetID     int,
    @codigo       char(4),
    @nome         varchar(64))
AS
BEGIN
    BEGIN TRAN

    UPDATE [cep].[subSetores]
       SET [codigo]      = @codigo,
           [nome]        = @nome
     WHERE [subSetID] = @subSetID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[cep.subSetoresProUpd]: Cannot update  in [cep].[subSetores] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.subSetoresProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.subSetoresProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.subSetoresProUpd >>>'
go


