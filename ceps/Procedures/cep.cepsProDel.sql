/* 
 * PROCEDURE: [cep.cepsProDel] 
 */

CREATE PROCEDURE [cep.cepsProDel]
(
    @cepID           int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [cep].[ceps]
     WHERE [cepID] = @cepID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[cep.cepsProDel]: Cannot delete because foreign keys still exist in [cep].[ceps] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.cepsProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.cepsProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.cepsProDel >>>'
go


