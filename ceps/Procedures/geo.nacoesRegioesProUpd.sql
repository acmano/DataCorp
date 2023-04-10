/* 
 * PROCEDURE: [geo.nacoesRegioesProUpd] 
 */

CREATE PROCEDURE [geo.nacoesRegioesProUpd]
(
    @nacRegID     int,
    @nacID        int,
    @regID        int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [geo].[nacoesRegioes]
       SET [nacID]       = @nacID,
           [regID]       = @regID
     WHERE [nacRegID] = @nacRegID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[geo.nacoesRegioesProUpd]: Cannot update  in [geo].[nacoesRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.nacoesRegioesProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.nacoesRegioesProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.nacoesRegioesProUpd >>>'
go


