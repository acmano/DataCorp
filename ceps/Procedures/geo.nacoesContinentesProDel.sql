/* 
 * PROCEDURE: [geo.nacoesContinentesProDel] 
 */

CREATE PROCEDURE [geo.nacoesContinentesProDel]
(
    @nacCntID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [geo].[nacoesContinentes]
     WHERE [nacCntID] = @nacCntID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[geo.nacoesContinentesProDel]: Cannot delete because foreign keys still exist in [geo].[nacoesContinentes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.nacoesContinentesProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.nacoesContinentesProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.nacoesContinentesProDel >>>'
go


