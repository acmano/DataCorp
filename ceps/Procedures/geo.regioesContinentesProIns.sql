/* 
 * PROCEDURE: [geo.regioesContinentesProIns] 
 */

CREATE PROCEDURE [geo.regioesContinentesProIns]
(
    @ctnID        int,
    @regID        int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [geo].[regioesContinentes]([ctnID],
                                           [regID])
    VALUES(@ctnID,
           @regID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[geo.regioesContinentesProIns]: Cannot insert because primary key value not found in [geo].[regioesContinentes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('geo.regioesContinentesProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.regioesContinentesProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.regioesContinentesProIns >>>'
go


