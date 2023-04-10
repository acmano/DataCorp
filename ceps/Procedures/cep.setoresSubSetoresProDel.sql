/* 
 * PROCEDURE: [cep.setoresSubSetoresProDel] 
 */

CREATE PROCEDURE [cep.setoresSubSetoresProDel]
(
    @setSubSetID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [cep].[setoresSubSetores]
     WHERE [setSubSetID] = @setSubSetID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[cep.setoresSubSetoresProDel]: Cannot delete because foreign keys still exist in [cep].[setoresSubSetores] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.setoresSubSetoresProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.setoresSubSetoresProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.setoresSubSetoresProDel >>>'
go


