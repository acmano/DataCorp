/* 
 * PROCEDURE: [geo.subRegioesProDel] 
 */

CREATE PROCEDURE [geo.subRegioesProDel]
(
    @subRegID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [geo].[subRegioes]
     WHERE [subRegID] = @subRegID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[geo.subRegioesProDel]: Cannot delete because foreign keys still exist in [geo].[subRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.subRegioesProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.subRegioesProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.subRegioesProDel >>>'
go


