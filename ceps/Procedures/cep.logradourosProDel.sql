/* 
 * PROCEDURE: [cep.logradourosProDel] 
 */

CREATE PROCEDURE [cep.logradourosProDel]
(
    @logID            int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [cep].[logradouros]
     WHERE [logID] = @logID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[cep.logradourosProDel]: Cannot delete because foreign keys still exist in [cep].[logradouros] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.logradourosProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.logradourosProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.logradourosProDel >>>'
go


