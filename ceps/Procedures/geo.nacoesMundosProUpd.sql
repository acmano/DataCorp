/* 
 * PROCEDURE: [geo.nacoesMundosProUpd] 
 */

CREATE PROCEDURE [geo.nacoesMundosProUpd]
(
    @nacMunID     int,
    @nacID        int,
    @munID        int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [geo].[nacoesMundos]
       SET [nacID]       = @nacID,
           [munID]       = @munID
     WHERE [nacMunID] = @nacMunID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[geo.nacoesMundosProUpd]: Cannot update  in [geo].[nacoesMundos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.nacoesMundosProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.nacoesMundosProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.nacoesMundosProUpd >>>'
go


