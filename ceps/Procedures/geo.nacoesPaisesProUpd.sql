/* 
 * PROCEDURE: [geo.nacoesPaisesProUpd] 
 */

CREATE PROCEDURE [geo.nacoesPaisesProUpd]
(
    @nacPaiID     int,
    @nacID        int,
    @paiID        int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [geo].[nacoesPaises]
       SET [nacID]       = @nacID,
           [paiID]       = @paiID
     WHERE [nacPaiID] = @nacPaiID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[geo.nacoesPaisesProUpd]: Cannot update  in [geo].[nacoesPaises] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.nacoesPaisesProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.nacoesPaisesProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.nacoesPaisesProUpd >>>'
go


