/* 
 * PROCEDURE: [geo.paisesRegioesProIns] 
 */

CREATE PROCEDURE [geo.paisesRegioesProIns]
(
    @paiID        int,
    @regID        int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [geo].[paisesRegioes]([paiID],
                                      [regID])
    VALUES(@paiID,
           @regID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[geo.paisesRegioesProIns]: Cannot insert because primary key value not found in [geo].[paisesRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('geo.paisesRegioesProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.paisesRegioesProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.paisesRegioesProIns >>>'
go


