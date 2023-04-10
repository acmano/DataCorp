/* 
 * PROCEDURE: [cep.logradouroTipoProUpd] 
 */

CREATE PROCEDURE [cep.logradouroTipoProUpd]
(
    @logTipID               int,
    @nome                   varchar(64),
    @descricao              varchar(256)            = NULL,
    @descricaoAbreviada     char(20))
AS
BEGIN
    BEGIN TRAN

    UPDATE [cep].[logradouroTipo]
       SET [nome]                  = @nome,
           [descricao]             = @descricao,
           [descricaoAbreviada]    = @descricaoAbreviada
     WHERE [logTipID] = @logTipID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[cep.logradouroTipoProUpd]: Cannot update  in [cep].[logradouroTipo] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.logradouroTipoProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.logradouroTipoProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.logradouroTipoProUpd >>>'
go


