/* 
 * PROCEDURE: [geo.continentesMundosProUpd] 
 */

CREATE PROCEDURE [geo.continentesMundosProUpd]
(
    @ctnMunID     int,
    @munID        int,
    @ctnID        int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [geo].[continentesMundos]
       SET [munID]       = @munID,
           [ctnID]       = @ctnID
     WHERE [ctnMunID] = @ctnMunID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[geo.continentesMundosProUpd]: Cannot update  in [geo].[continentesMundos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.continentesMundosProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.continentesMundosProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.continentesMundosProUpd >>>'
go


