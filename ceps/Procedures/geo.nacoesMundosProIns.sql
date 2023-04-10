/* 
 * PROCEDURE: [geo.nacoesMundosProIns] 
 */

CREATE PROCEDURE [geo.nacoesMundosProIns]
(
    @nacID        int,
    @munID        int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [geo].[nacoesMundos]([nacID],
                                     [munID])
    VALUES(@nacID,
           @munID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[geo.nacoesMundosProIns]: Cannot insert because primary key value not found in [geo].[nacoesMundos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('geo.nacoesMundosProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.nacoesMundosProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.nacoesMundosProIns >>>'
go


