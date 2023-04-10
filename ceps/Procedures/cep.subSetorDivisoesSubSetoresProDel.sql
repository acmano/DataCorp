/* 
 * PROCEDURE: [cep.subSetorDivisoesSubSetoresProDel] 
 */

CREATE PROCEDURE [cep.subSetorDivisoesSubSetoresProDel]
(
    @subSetDivSubSetID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [cep].[subSetorDivisoesSubSetores]
     WHERE [subSetDivSubSetID] = @subSetDivSubSetID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[cep.subSetorDivisoesSubSetoresProDel]: Cannot delete because foreign keys still exist in [cep].[subSetorDivisoesSubSetores] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.subSetorDivisoesSubSetoresProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.subSetorDivisoesSubSetoresProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.subSetorDivisoesSubSetoresProDel >>>'
go


