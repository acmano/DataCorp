/* 
 * PROCEDURE: [cep.subSetorDivisoesSubSetoresProIns] 
 */

CREATE PROCEDURE [cep.subSetorDivisoesSubSetoresProIns]
(
    @subSetID              int,
    @subSetDivID           int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [cep].[subSetorDivisoesSubSetores]([subSetID],
                                                   [subSetDivID])
    VALUES(@subSetID,
           @subSetDivID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[cep.subSetorDivisoesSubSetoresProIns]: Cannot insert because primary key value not found in [cep].[subSetorDivisoesSubSetores] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('cep.subSetorDivisoesSubSetoresProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.subSetorDivisoesSubSetoresProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.subSetorDivisoesSubSetoresProIns >>>'
go


