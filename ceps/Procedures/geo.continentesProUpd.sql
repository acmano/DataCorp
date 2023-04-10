/* 
 * PROCEDURE: [geo.continentesProUpd] 
 */

CREATE PROCEDURE [geo.continentesProUpd]
(
    @ctnID     int,
    @nome      varchar(64))
AS
BEGIN
    BEGIN TRAN

    UPDATE [geo].[continentes]
       SET [nome]     = @nome
     WHERE [ctnID] = @ctnID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[geo.continentesProUpd]: Cannot update  in [geo].[continentes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.continentesProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.continentesProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.continentesProUpd >>>'
go


