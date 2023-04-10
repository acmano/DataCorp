/* 
 * PROCEDURE: [geo.regioesContinentesProUpd] 
 */

CREATE PROCEDURE [geo.regioesContinentesProUpd]
(
    @regCtnID     int,
    @ctnID        int,
    @regID        int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [geo].[regioesContinentes]
       SET [ctnID]       = @ctnID,
           [regID]       = @regID
     WHERE [regCtnID] = @regCtnID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[geo.regioesContinentesProUpd]: Cannot update  in [geo].[regioesContinentes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.regioesContinentesProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.regioesContinentesProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.regioesContinentesProUpd >>>'
go


