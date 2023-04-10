/* 
 * PROCEDURE: [geo.nacoesSubRegioesProIns] 
 */

CREATE PROCEDURE [geo.nacoesSubRegioesProIns]
(
    @nacID           int,
    @subRegID        int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [geo].[nacoesSubRegioes]([nacID],
                                         [subRegID])
    VALUES(@nacID,
           @subRegID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[geo.nacoesSubRegioesProIns]: Cannot insert because primary key value not found in [geo].[nacoesSubRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('geo.nacoesSubRegioesProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.nacoesSubRegioesProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.nacoesSubRegioesProIns >>>'
go


