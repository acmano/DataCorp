/* 
 * PROCEDURE: [geo.mundosProUpd] 
 */

CREATE PROCEDURE [geo.mundosProUpd]
(
    @munID     int,
    @nome      varchar(64))
AS
BEGIN
    BEGIN TRAN

    UPDATE [geo].[mundos]
       SET [nome]     = @nome
     WHERE [munID] = @munID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[geo.mundosProUpd]: Cannot update  in [geo].[mundos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.mundosProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.mundosProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.mundosProUpd >>>'
go


