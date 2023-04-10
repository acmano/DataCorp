/* 
 * PROCEDURE: [geo.paisesProDel] 
 */

CREATE PROCEDURE [geo.paisesProDel]
(
    @paiID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [geo].[paises]
     WHERE [paiID] = @paiID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[geo.paisesProDel]: Cannot delete because foreign keys still exist in [geo].[paises] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.paisesProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.paisesProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.paisesProDel >>>'
go


