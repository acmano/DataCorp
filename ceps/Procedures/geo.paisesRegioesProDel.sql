/* 
 * PROCEDURE: [geo.paisesRegioesProDel] 
 */

CREATE PROCEDURE [geo.paisesRegioesProDel]
(
    @paiRegID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [geo].[paisesRegioes]
     WHERE [paiRegID] = @paiRegID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[geo.paisesRegioesProDel]: Cannot delete because foreign keys still exist in [geo].[paisesRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.paisesRegioesProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.paisesRegioesProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.paisesRegioesProDel >>>'
go


