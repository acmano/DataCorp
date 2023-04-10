/* 
 * PROCEDURE: [geo.nacoesProDel] 
 */

CREATE PROCEDURE [geo.nacoesProDel]
(
    @nacID         int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [geo].[nacoes]
     WHERE [nacID] = @nacID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[geo.nacoesProDel]: Cannot delete because foreign keys still exist in [geo].[nacoes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.nacoesProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.nacoesProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.nacoesProDel >>>'
go


