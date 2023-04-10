/* 
 * PROCEDURE: [cep.cepsProUpd] 
 */

CREATE PROCEDURE [cep.cepsProUpd]
(
    @cepID           int,
    @subSetDivID     int,
    @sufID           int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [cep].[ceps]
       SET [subSetDivID]    = @subSetDivID,
           [sufID]          = @sufID
     WHERE [cepID] = @cepID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[cep.cepsProUpd]: Cannot update  in [cep].[ceps] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.cepsProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.cepsProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.cepsProUpd >>>'
go


