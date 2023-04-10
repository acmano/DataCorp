/* 
 * PROCEDURE: [cep.enderecosTiposProUpd] 
 */

CREATE PROCEDURE [cep.enderecosTiposProUpd]
(
    @endTipID     int,
    @codigo       varchar(15),
    @nome         varchar(64))
AS
BEGIN
    BEGIN TRAN

    UPDATE [cep].[enderecosTipos]
       SET [codigo]      = @codigo,
           [nome]        = @nome
     WHERE [endTipID] = @endTipID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[cep.enderecosTiposProUpd]: Cannot update  in [cep].[enderecosTipos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.enderecosTiposProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.enderecosTiposProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.enderecosTiposProUpd >>>'
go


