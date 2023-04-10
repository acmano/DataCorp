/* 
 * PROCEDURE: [geo.nacoesRegioesProDel] 
 */

CREATE PROCEDURE [geo.nacoesRegioesProDel]
(
    @nacRegID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [geo].[nacoesRegioes]
     WHERE [nacRegID] = @nacRegID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[geo.nacoesRegioesProDel]: Cannot delete because foreign keys still exist in [geo].[nacoesRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.nacoesRegioesProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.nacoesRegioesProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.nacoesRegioesProDel >>>'
go


