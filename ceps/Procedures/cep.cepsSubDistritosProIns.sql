/* 
 * PROCEDURE: [cep.cepsSubDistritosProIns] 
 */

CREATE PROCEDURE [cep.cepsSubDistritosProIns]
(
    @subDisID        int,
    @cepID           int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [cep].[cepsSubDistritos]([subDisID],
                                         [cepID])
    VALUES(@subDisID,
           @cepID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[cep.cepsSubDistritosProIns]: Cannot insert because primary key value not found in [cep].[cepsSubDistritos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('cep.cepsSubDistritosProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.cepsSubDistritosProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.cepsSubDistritosProIns >>>'
go


