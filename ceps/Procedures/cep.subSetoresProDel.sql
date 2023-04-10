/* 
 * PROCEDURE: [cep.subSetoresProDel] 
 */

CREATE PROCEDURE [cep.subSetoresProDel]
(
    @subSetID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [cep].[subSetores]
     WHERE [subSetID] = @subSetID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[cep.subSetoresProDel]: Cannot delete because foreign keys still exist in [cep].[subSetores] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.subSetoresProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.subSetoresProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.subSetoresProDel >>>'
go


