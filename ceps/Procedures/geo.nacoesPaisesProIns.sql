/* 
 * PROCEDURE: [geo.nacoesPaisesProIns] 
 */

CREATE PROCEDURE [geo.nacoesPaisesProIns]
(
    @nacID        int,
    @paiID        int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [geo].[nacoesPaises]([nacID],
                                     [paiID])
    VALUES(@nacID,
           @paiID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[geo.nacoesPaisesProIns]: Cannot insert because primary key value not found in [geo].[nacoesPaises] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('geo.nacoesPaisesProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.nacoesPaisesProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.nacoesPaisesProIns >>>'
go


