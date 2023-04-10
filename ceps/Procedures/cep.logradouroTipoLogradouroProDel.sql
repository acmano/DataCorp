/* 
 * PROCEDURE: [cep.logradouroTipoLogradouroProDel] 
 */

CREATE PROCEDURE [cep.logradouroTipoLogradouroProDel]
(
    @logTipLogID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [cep].[logradouroTipoLogradouro]
     WHERE [logTipLogID] = @logTipLogID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[cep.logradouroTipoLogradouroProDel]: Cannot delete because foreign keys still exist in [cep].[logradouroTipoLogradouro] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.logradouroTipoLogradouroProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.logradouroTipoLogradouroProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.logradouroTipoLogradouroProDel >>>'
go


