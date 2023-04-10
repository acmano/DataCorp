/* 
 * PROCEDURE: [cep.logradouroTipoProIns] 
 */

CREATE PROCEDURE [cep.logradouroTipoProIns]
(
    @nome                   varchar(64),
    @descricao              varchar(256)            = NULL,
    @descricaoAbreviada     char(20))
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [cep].[logradouroTipo]([nome],
                                       [descricao],
                                       [descricaoAbreviada])
    VALUES(@nome,
           @descricao,
           @descricaoAbreviada)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[cep.logradouroTipoProIns]: Cannot insert because primary key value not found in [cep].[logradouroTipo] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('cep.logradouroTipoProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.logradouroTipoProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.logradouroTipoProIns >>>'
go


