/* 
 * PROCEDURE: [geo.regioesContinentesProDel] 
 */

CREATE PROCEDURE [geo.regioesContinentesProDel]
(
    @regCtnID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [geo].[regioesContinentes]
     WHERE [regCtnID] = @regCtnID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[geo.regioesContinentesProDel]: Cannot delete because foreign keys still exist in [geo].[regioesContinentes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.regioesContinentesProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.regioesContinentesProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.regioesContinentesProDel >>>'
go


