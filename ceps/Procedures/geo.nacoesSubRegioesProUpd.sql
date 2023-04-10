/* 
 * PROCEDURE: [geo.nacoesSubRegioesProUpd] 
 */

CREATE PROCEDURE [geo.nacoesSubRegioesProUpd]
(
    @nacSubRegID     int,
    @nacID           int,
    @subRegID        int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [geo].[nacoesSubRegioes]
       SET [nacID]          = @nacID,
           [subRegID]       = @subRegID
     WHERE [nacSubRegID] = @nacSubRegID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[geo.nacoesSubRegioesProUpd]: Cannot update  in [geo].[nacoesSubRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.nacoesSubRegioesProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.nacoesSubRegioesProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.nacoesSubRegioesProUpd >>>'
go


