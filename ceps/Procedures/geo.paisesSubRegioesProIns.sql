/* 
 * PROCEDURE: [geo.paisesSubRegioesProIns] 
 */

CREATE PROCEDURE [geo.paisesSubRegioesProIns]
(
    @paiID           int,
    @subRegID        int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [geo].[paisesSubRegioes]([paiID],
                                         [subRegID])
    VALUES(@paiID,
           @subRegID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[geo.paisesSubRegioesProIns]: Cannot insert because primary key value not found in [geo].[paisesSubRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('geo.paisesSubRegioesProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.paisesSubRegioesProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.paisesSubRegioesProIns >>>'
go


