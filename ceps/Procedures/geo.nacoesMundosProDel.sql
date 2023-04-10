/* 
 * PROCEDURE: [geo.nacoesMundosProDel] 
 */

CREATE PROCEDURE [geo.nacoesMundosProDel]
(
    @nacMunID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [geo].[nacoesMundos]
     WHERE [nacMunID] = @nacMunID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[geo.nacoesMundosProDel]: Cannot delete because foreign keys still exist in [geo].[nacoesMundos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.nacoesMundosProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.nacoesMundosProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.nacoesMundosProDel >>>'
go


