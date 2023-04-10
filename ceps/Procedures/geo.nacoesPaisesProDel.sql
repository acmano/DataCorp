/* 
 * PROCEDURE: [geo.nacoesPaisesProDel] 
 */

CREATE PROCEDURE [geo.nacoesPaisesProDel]
(
    @nacPaiID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [geo].[nacoesPaises]
     WHERE [nacPaiID] = @nacPaiID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[geo.nacoesPaisesProDel]: Cannot delete because foreign keys still exist in [geo].[nacoesPaises] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.nacoesPaisesProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.nacoesPaisesProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.nacoesPaisesProDel >>>'
go


