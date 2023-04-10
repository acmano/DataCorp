/* 
 * PROCEDURE: [geo.nacoesRegioesProIns] 
 */

CREATE PROCEDURE [geo.nacoesRegioesProIns]
(
    @nacID        int,
    @regID        int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [geo].[nacoesRegioes]([nacID],
                                      [regID])
    VALUES(@nacID,
           @regID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[geo.nacoesRegioesProIns]: Cannot insert because primary key value not found in [geo].[nacoesRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('geo.nacoesRegioesProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.nacoesRegioesProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.nacoesRegioesProIns >>>'
go


