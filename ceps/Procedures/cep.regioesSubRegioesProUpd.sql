/* 
 * PROCEDURE: [cep.regioesSubRegioesProUpd] 
 */

CREATE PROCEDURE [cep.regioesSubRegioesProUpd]
(
    @regSubRegID     int,
    @regID           int,
    @subRegID        int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [cep].[regioesSubRegioes]
       SET [regID]          = @regID,
           [subRegID]       = @subRegID
     WHERE [regSubRegID] = @regSubRegID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[cep.regioesSubRegioesProUpd]: Cannot update  in [cep].[regioesSubRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.regioesSubRegioesProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.regioesSubRegioesProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.regioesSubRegioesProUpd >>>'
go


