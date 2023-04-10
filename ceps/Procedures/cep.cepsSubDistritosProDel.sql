/* 
 * PROCEDURE: [cep.cepsSubDistritosProDel] 
 */

CREATE PROCEDURE [cep.cepsSubDistritosProDel]
(
    @cepSubDisID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [cep].[cepsSubDistritos]
     WHERE [cepSubDisID] = @cepSubDisID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[cep.cepsSubDistritosProDel]: Cannot delete because foreign keys still exist in [cep].[cepsSubDistritos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.cepsSubDistritosProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.cepsSubDistritosProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.cepsSubDistritosProDel >>>'
go


