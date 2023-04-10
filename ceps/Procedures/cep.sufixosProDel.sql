/* 
 * PROCEDURE: [cep.sufixosProDel] 
 */

CREATE PROCEDURE [cep.sufixosProDel]
(
    @sufID      int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [cep].[sufixos]
     WHERE [sufID] = @sufID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[cep.sufixosProDel]: Cannot delete because foreign keys still exist in [cep].[sufixos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.sufixosProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.sufixosProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.sufixosProDel >>>'
go


