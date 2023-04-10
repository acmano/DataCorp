/* 
 * PROCEDURE: [geo.regioesContinentesProSel] 
 */

CREATE PROCEDURE [geo.regioesContinentesProSel]
(
    @regCtnID     int)
AS
BEGIN
    SELECT [regCtnID],
           [ctnID],
           [regID]
      FROM [geo].[regioesContinentes]
     WHERE [regCtnID] = @regCtnID

    RETURN(0)
END
go
IF OBJECT_ID('geo.regioesContinentesProSel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.regioesContinentesProSel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.regioesContinentesProSel >>>'
go


