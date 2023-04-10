/* 
 * PROCEDURE: [cep.subSetorDivisoesSubSetoresProUpd] 
 */

CREATE PROCEDURE [cep.subSetorDivisoesSubSetoresProUpd]
(
    @subSetDivSubSetID     int,
    @subSetID              int,
    @subSetDivID           int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [cep].[subSetorDivisoesSubSetores]
       SET [subSetID]             = @subSetID,
           [subSetDivID]          = @subSetDivID
     WHERE [subSetDivSubSetID] = @subSetDivSubSetID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[cep.subSetorDivisoesSubSetoresProUpd]: Cannot update  in [cep].[subSetorDivisoesSubSetores] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.subSetorDivisoesSubSetoresProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.subSetorDivisoesSubSetoresProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.subSetorDivisoesSubSetoresProUpd >>>'
go


