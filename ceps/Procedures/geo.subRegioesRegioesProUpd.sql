/* 
 * PROCEDURE: [geo.subRegioesRegioesProUpd] 
 */

CREATE PROCEDURE [geo.subRegioesRegioesProUpd]
(
    @subRegRegID     int,
    @regID           int,
    @subRegID        int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [geo].[subRegioesRegioes]
       SET [regID]          = @regID,
           [subRegID]       = @subRegID
     WHERE [subRegRegID] = @subRegRegID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[geo.subRegioesRegioesProUpd]: Cannot update  in [geo].[subRegioesRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.subRegioesRegioesProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.subRegioesRegioesProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.subRegioesRegioesProUpd >>>'
go


