/* 
 * PROCEDURE: [geo.nacoesContinentesProIns] 
 */

CREATE PROCEDURE [geo.nacoesContinentesProIns]
(
    @nacID        int,
    @ctnID        int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [geo].[nacoesContinentes]([nacID],
                                          [ctnID])
    VALUES(@nacID,
           @ctnID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[geo.nacoesContinentesProIns]: Cannot insert because primary key value not found in [geo].[nacoesContinentes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('geo.nacoesContinentesProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.nacoesContinentesProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.nacoesContinentesProIns >>>'
go


