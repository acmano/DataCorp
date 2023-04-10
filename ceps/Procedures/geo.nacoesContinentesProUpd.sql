/* 
 * PROCEDURE: [geo.nacoesContinentesProUpd] 
 */

CREATE PROCEDURE [geo.nacoesContinentesProUpd]
(
    @nacCntID     int,
    @nacID        int,
    @ctnID        int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [geo].[nacoesContinentes]
       SET [nacID]       = @nacID,
           [ctnID]       = @ctnID
     WHERE [nacCntID] = @nacCntID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[geo.nacoesContinentesProUpd]: Cannot update  in [geo].[nacoesContinentes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.nacoesContinentesProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.nacoesContinentesProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.nacoesContinentesProUpd >>>'
go


