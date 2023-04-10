/* 
 * PROCEDURE: [geo.regioesProDel] 
 */

CREATE PROCEDURE [geo.regioesProDel]
(
    @regID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [geo].[regioes]
     WHERE [regID] = @regID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[geo.regioesProDel]: Cannot delete because foreign keys still exist in [geo].[regioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.regioesProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.regioesProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.regioesProDel >>>'
go


