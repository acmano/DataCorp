/* 
 * PROCEDURE: [geo.subRegioesRegioesProIns] 
 */

CREATE PROCEDURE [geo.subRegioesRegioesProIns]
(
    @regID           int,
    @subRegID        int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [geo].[subRegioesRegioes]([regID],
                                          [subRegID])
    VALUES(@regID,
           @subRegID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[geo.subRegioesRegioesProIns]: Cannot insert because primary key value not found in [geo].[subRegioesRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('geo.subRegioesRegioesProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.subRegioesRegioesProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.subRegioesRegioesProIns >>>'
go


