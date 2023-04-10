/* 
 * PROCEDURE: [cep.cepsMunicipiosProUpd] 
 */

CREATE PROCEDURE [cep.cepsMunicipiosProUpd]
(
    @cepMunID     int,
    @munID        int,
    @cepID        int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [cep].[cepsMunicipios]
       SET [munID]       = @munID,
           [cepID]       = @cepID
     WHERE [cepMunID] = @cepMunID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[cep.cepsMunicipiosProUpd]: Cannot update  in [cep].[cepsMunicipios] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.cepsMunicipiosProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.cepsMunicipiosProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.cepsMunicipiosProUpd >>>'
go


