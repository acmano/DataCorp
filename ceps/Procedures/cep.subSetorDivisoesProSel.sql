/* 
 * PROCEDURE: [cep.subSetorDivisoesProSel] 
 */

CREATE PROCEDURE [cep.subSetorDivisoesProSel]
(
    @subSetDivID     int)
AS
BEGIN
    SELECT [subSetDivID],
           [codigo],
           [nome]
      FROM [cep].[subSetorDivisoes]
     WHERE [subSetDivID] = @subSetDivID

    RETURN(0)
END
go
IF OBJECT_ID('cep.subSetorDivisoesProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.subSetorDivisoesProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.subSetorDivisoesProSel >>>'
go


