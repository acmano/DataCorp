/* 
 * PROCEDURE: [geo.paisesProUpd] 
 */

CREATE PROCEDURE [geo.paisesProUpd]
(
    @paiID     int,
    @nome      varchar(64))
AS
BEGIN
    BEGIN TRAN

    UPDATE [geo].[paises]
       SET [nome]     = @nome
     WHERE [paiID] = @paiID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[geo.paisesProUpd]: Cannot update  in [geo].[paises] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.paisesProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.paisesProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.paisesProUpd >>>'
go


