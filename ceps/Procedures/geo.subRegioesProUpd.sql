/* 
 * PROCEDURE: [geo.subRegioesProUpd] 
 */

CREATE PROCEDURE [geo.subRegioesProUpd]
(
    @subRegID     int,
    @nome         varchar(64))
AS
BEGIN
    BEGIN TRAN

    UPDATE [geo].[subRegioes]
       SET [nome]        = @nome
     WHERE [subRegID] = @subRegID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[geo.subRegioesProUpd]: Cannot update  in [geo].[subRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.subRegioesProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.subRegioesProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.subRegioesProUpd >>>'
go


