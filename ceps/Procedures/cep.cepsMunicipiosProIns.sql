/* 
 * PROCEDURE: [cep.cepsMunicipiosProIns] 
 */

CREATE PROCEDURE [cep.cepsMunicipiosProIns]
(
    @munID        int,
    @cepID        int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [cep].[cepsMunicipios]([munID],
                                       [cepID])
    VALUES(@munID,
           @cepID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[cep.cepsMunicipiosProIns]: Cannot insert because primary key value not found in [cep].[cepsMunicipios] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('cep.cepsMunicipiosProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.cepsMunicipiosProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.cepsMunicipiosProIns >>>'
go


