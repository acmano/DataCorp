/* 
 * PROCEDURE: [cep.regioesSubRegioesProIns] 
 */

CREATE PROCEDURE [cep.regioesSubRegioesProIns]
(
    @regID           int,
    @subRegID        int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [cep].[regioesSubRegioes]([regID],
                                          [subRegID])
    VALUES(@regID,
           @subRegID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[cep.regioesSubRegioesProIns]: Cannot insert because primary key value not found in [cep].[regioesSubRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('cep.regioesSubRegioesProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.regioesSubRegioesProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.regioesSubRegioesProIns >>>'
go


