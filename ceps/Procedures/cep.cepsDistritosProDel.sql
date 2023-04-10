/* 
 * PROCEDURE: [cep.cepsDistritosProDel] 
 */

CREATE PROCEDURE [cep.cepsDistritosProDel]
(
    @cepDisID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [cep].[cepsDistritos]
     WHERE [cepDisID] = @cepDisID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[cep.cepsDistritosProDel]: Cannot delete because foreign keys still exist in [cep].[cepsDistritos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.cepsDistritosProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.cepsDistritosProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.cepsDistritosProDel >>>'
go


