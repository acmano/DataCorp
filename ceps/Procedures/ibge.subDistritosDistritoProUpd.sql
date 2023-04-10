/* 
 * PROCEDURE: [ibge.subDistritosDistritoProUpd] 
 */

CREATE PROCEDURE [ibge.subDistritosDistritoProUpd]
(
    @subDisDisID     int,
    @disID           int,
    @subDisID        int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [ibge].[subDistritosDistrito]
       SET [disID]          = @disID,
           [subDisID]       = @subDisID
     WHERE [subDisDisID] = @subDisDisID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[ibge.subDistritosDistritoProUpd]: Cannot update  in [ibge].[subDistritosDistrito] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.subDistritosDistritoProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.subDistritosDistritoProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.subDistritosDistritoProUpd >>>'
go


