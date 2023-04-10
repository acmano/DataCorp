/* 
 * PROCEDURE: [geo.continentesMundosProIns] 
 */

CREATE PROCEDURE [geo.continentesMundosProIns]
(
    @munID        int,
    @ctnID        int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [geo].[continentesMundos]([munID],
                                          [ctnID])
    VALUES(@munID,
           @ctnID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[geo.continentesMundosProIns]: Cannot insert because primary key value not found in [geo].[continentesMundos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('geo.continentesMundosProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.continentesMundosProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.continentesMundosProIns >>>'
go


