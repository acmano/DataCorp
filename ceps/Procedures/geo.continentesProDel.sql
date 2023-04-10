/* 
 * PROCEDURE: [geo.continentesProDel] 
 */

CREATE PROCEDURE [geo.continentesProDel]
(
    @ctnID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [geo].[continentes]
     WHERE [ctnID] = @ctnID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[geo.continentesProDel]: Cannot delete because foreign keys still exist in [geo].[continentes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.continentesProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.continentesProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.continentesProDel >>>'
go


