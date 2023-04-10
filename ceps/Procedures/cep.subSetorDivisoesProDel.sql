/* 
 * PROCEDURE: [cep.subSetorDivisoesProDel] 
 */

CREATE PROCEDURE [cep.subSetorDivisoesProDel]
(
    @subSetDivID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [cep].[subSetorDivisoes]
     WHERE [subSetDivID] = @subSetDivID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[cep.subSetorDivisoesProDel]: Cannot delete because foreign keys still exist in [cep].[subSetorDivisoes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.subSetorDivisoesProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.subSetorDivisoesProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.subSetorDivisoesProDel >>>'
go


