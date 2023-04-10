/* 
 * PROCEDURE: [cep.cepsDistritosProUpd] 
 */

CREATE PROCEDURE [cep.cepsDistritosProUpd]
(
    @cepDisID     int,
    @disID        int,
    @cepID        int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [cep].[cepsDistritos]
       SET [disID]       = @disID,
           [cepID]       = @cepID
     WHERE [cepDisID] = @cepDisID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[cep.cepsDistritosProUpd]: Cannot update  in [cep].[cepsDistritos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.cepsDistritosProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.cepsDistritosProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.cepsDistritosProUpd >>>'
go


