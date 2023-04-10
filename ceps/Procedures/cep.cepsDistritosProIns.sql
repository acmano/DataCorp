/* 
 * PROCEDURE: [cep.cepsDistritosProIns] 
 */

CREATE PROCEDURE [cep.cepsDistritosProIns]
(
    @disID        int,
    @cepID        int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [cep].[cepsDistritos]([disID],
                                      [cepID])
    VALUES(@disID,
           @cepID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[cep.cepsDistritosProIns]: Cannot insert because primary key value not found in [cep].[cepsDistritos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('cep.cepsDistritosProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.cepsDistritosProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.cepsDistritosProIns >>>'
go


