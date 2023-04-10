/* 
 * PROCEDURE: [ibge.regiaoProDel] 
 */

CREATE PROCEDURE [ibge.regiaoProDel]
(
    @regID      int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [ibge].[regiao]
     WHERE [regID] = @regID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[ibge.regiaoProDel]: Cannot delete because foreign keys still exist in [ibge].[regiao] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.regiaoProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.regiaoProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.regiaoProDel >>>'
go


