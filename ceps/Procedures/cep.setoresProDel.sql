/* 
 * PROCEDURE: [cep.setoresProDel] 
 */

CREATE PROCEDURE [cep.setoresProDel]
(
    @setID      int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [cep].[setores]
     WHERE [setID] = @setID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[cep.setoresProDel]: Cannot delete because foreign keys still exist in [cep].[setores] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.setoresProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.setoresProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.setoresProDel >>>'
go


