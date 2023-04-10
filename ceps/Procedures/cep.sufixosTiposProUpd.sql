/* 
 * PROCEDURE: [cep.sufixosTiposProUpd] 
 */

CREATE PROCEDURE [cep.sufixosTiposProUpd]
(
    @sufTipID     int,
    @codigo       char(2),
    @nome         varchar(64))
AS
BEGIN
    BEGIN TRAN

    UPDATE [cep].[sufixosTipos]
       SET [codigo]      = @codigo,
           [nome]        = @nome
     WHERE [sufTipID] = @sufTipID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[cep.sufixosTiposProUpd]: Cannot update  in [cep].[sufixosTipos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.sufixosTiposProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.sufixosTiposProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.sufixosTiposProUpd >>>'
go


