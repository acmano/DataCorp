/* 
 * PROCEDURE: [geo.paisesRegioesProUpd] 
 */

CREATE PROCEDURE [geo.paisesRegioesProUpd]
(
    @paiRegID     int,
    @paiID        int,
    @regID        int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [geo].[paisesRegioes]
       SET [paiID]       = @paiID,
           [regID]       = @regID
     WHERE [paiRegID] = @paiRegID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[geo.paisesRegioesProUpd]: Cannot update  in [geo].[paisesRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.paisesRegioesProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.paisesRegioesProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.paisesRegioesProUpd >>>'
go


