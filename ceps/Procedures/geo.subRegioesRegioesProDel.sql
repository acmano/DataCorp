/* 
 * PROCEDURE: [geo.subRegioesRegioesProDel] 
 */

CREATE PROCEDURE [geo.subRegioesRegioesProDel]
(
    @subRegRegID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [geo].[subRegioesRegioes]
     WHERE [subRegRegID] = @subRegRegID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[geo.subRegioesRegioesProDel]: Cannot delete because foreign keys still exist in [geo].[subRegioesRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.subRegioesRegioesProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.subRegioesRegioesProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.subRegioesRegioesProDel >>>'
go


