/* 
 * PROCEDURE: [geo.nacoesSubRegioesProDel] 
 */

CREATE PROCEDURE [geo.nacoesSubRegioesProDel]
(
    @nacSubRegID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [geo].[nacoesSubRegioes]
     WHERE [nacSubRegID] = @nacSubRegID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[geo.nacoesSubRegioesProDel]: Cannot delete because foreign keys still exist in [geo].[nacoesSubRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.nacoesSubRegioesProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.nacoesSubRegioesProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.nacoesSubRegioesProDel >>>'
go


