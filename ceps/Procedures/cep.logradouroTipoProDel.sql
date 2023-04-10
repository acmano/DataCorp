/* 
 * PROCEDURE: [cep.logradouroTipoProDel] 
 */

CREATE PROCEDURE [cep.logradouroTipoProDel]
(
    @logTipID               int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [cep].[logradouroTipo]
     WHERE [logTipID] = @logTipID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[cep.logradouroTipoProDel]: Cannot delete because foreign keys still exist in [cep].[logradouroTipo] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.logradouroTipoProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.logradouroTipoProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.logradouroTipoProDel >>>'
go


