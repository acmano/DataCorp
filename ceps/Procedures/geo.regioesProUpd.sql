/* 
 * PROCEDURE: [geo.regioesProUpd] 
 */

CREATE PROCEDURE [geo.regioesProUpd]
(
    @regID     int,
    @nome      varchar(64))
AS
BEGIN
    BEGIN TRAN

    UPDATE [geo].[regioes]
       SET [nome]     = @nome
     WHERE [regID] = @regID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[geo.regioesProUpd]: Cannot update  in [geo].[regioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.regioesProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.regioesProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.regioesProUpd >>>'
go


