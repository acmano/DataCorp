/* 
 * PROCEDURE: [cep.cepsLogradourosProDel] 
 */

CREATE PROCEDURE [cep.cepsLogradourosProDel]
(
    @cepLogID        int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [cep].[cepsLogradouros]
     WHERE [cepLogID] = @cepLogID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[cep.cepsLogradourosProDel]: Cannot delete because foreign keys still exist in [cep].[cepsLogradouros] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.cepsLogradourosProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.cepsLogradourosProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.cepsLogradourosProDel >>>'
go


