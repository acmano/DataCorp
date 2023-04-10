/* 
 * PROCEDURE: [cep.cepsSubDistritosProUpd] 
 */

CREATE PROCEDURE [cep.cepsSubDistritosProUpd]
(
    @cepSubDisID     int,
    @subDisID        int,
    @cepID           int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [cep].[cepsSubDistritos]
       SET [subDisID]       = @subDisID,
           [cepID]          = @cepID
     WHERE [cepSubDisID] = @cepSubDisID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[cep.cepsSubDistritosProUpd]: Cannot update  in [cep].[cepsSubDistritos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.cepsSubDistritosProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.cepsSubDistritosProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.cepsSubDistritosProUpd >>>'
go


