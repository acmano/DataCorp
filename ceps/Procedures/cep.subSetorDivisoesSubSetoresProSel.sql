/* 
 * PROCEDURE: [cep.subSetorDivisoesSubSetoresProSel] 
 */

CREATE PROCEDURE [cep.subSetorDivisoesSubSetoresProSel]
(
    @subSetDivSubSetID     int)
AS
BEGIN
    SELECT [subSetDivSubSetID],
           [subSetID],
           [subSetDivID]
      FROM [cep].[subSetorDivisoesSubSetores]
     WHERE [subSetDivSubSetID] = @subSetDivSubSetID

    RETURN(0)
END
go
IF OBJECT_ID('cep.subSetorDivisoesSubSetoresProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.subSetorDivisoesSubSetoresProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.subSetorDivisoesSubSetoresProSel >>>'
go


