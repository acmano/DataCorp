/* 
 * PROCEDURE: [cep.cepsProIns] 
 */

CREATE PROCEDURE [cep.cepsProIns]
(
    @subSetDivID     int,
    @sufID           int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [cep].[ceps]([subSetDivID],
                             [sufID])
    VALUES(@subSetDivID,
           @sufID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[cep.cepsProIns]: Cannot insert because primary key value not found in [cep].[ceps] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('cep.cepsProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.cepsProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.cepsProIns >>>'
go


