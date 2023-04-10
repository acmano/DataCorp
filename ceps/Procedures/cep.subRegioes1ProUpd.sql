/* 
 * PROCEDURE: [cep.subRegioes1ProUpd] 
 */

CREATE PROCEDURE [cep.subRegioes1ProUpd]
(
    @subRegID     int,
    @codigo       char(2),
    @nome         varchar(64))
AS
BEGIN
    BEGIN TRAN

    UPDATE [cep].[subRegioes]
       SET [codigo]      = @codigo,
           [nome]        = @nome
     WHERE [subRegID] = @subRegID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[cep.subRegioes1ProUpd]: Cannot update  in [cep].[subRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.subRegioes1ProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.subRegioes1ProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.subRegioes1ProUpd >>>'
go


