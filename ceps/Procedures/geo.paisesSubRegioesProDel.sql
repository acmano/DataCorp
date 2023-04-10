/* 
 * PROCEDURE: [geo.paisesSubRegioesProDel] 
 */

CREATE PROCEDURE [geo.paisesSubRegioesProDel]
(
    @paiSubRegID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [geo].[paisesSubRegioes]
     WHERE [paiSubRegID] = @paiSubRegID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[geo.paisesSubRegioesProDel]: Cannot delete because foreign keys still exist in [geo].[paisesSubRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.paisesSubRegioesProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.paisesSubRegioesProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.paisesSubRegioesProDel >>>'
go


