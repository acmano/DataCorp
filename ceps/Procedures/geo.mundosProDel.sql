/* 
 * PROCEDURE: [geo.mundosProDel] 
 */

CREATE PROCEDURE [geo.mundosProDel]
(
    @munID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [geo].[mundos]
     WHERE [munID] = @munID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[geo.mundosProDel]: Cannot delete because foreign keys still exist in [geo].[mundos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.mundosProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.mundosProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.mundosProDel >>>'
go


