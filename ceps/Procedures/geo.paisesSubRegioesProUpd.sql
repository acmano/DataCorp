/* 
 * PROCEDURE: [geo.paisesSubRegioesProUpd] 
 */

CREATE PROCEDURE [geo.paisesSubRegioesProUpd]
(
    @paiSubRegID     int,
    @paiID           int,
    @subRegID        int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [geo].[paisesSubRegioes]
       SET [paiID]          = @paiID,
           [subRegID]       = @subRegID
     WHERE [paiSubRegID] = @paiSubRegID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[geo.paisesSubRegioesProUpd]: Cannot update  in [geo].[paisesSubRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.paisesSubRegioesProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.paisesSubRegioesProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.paisesSubRegioesProUpd >>>'
go


