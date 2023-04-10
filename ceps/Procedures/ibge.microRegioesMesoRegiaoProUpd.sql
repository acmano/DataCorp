/* 
 * PROCEDURE: [ibge.microRegioesMesoRegiaoProUpd] 
 */

CREATE PROCEDURE [ibge.microRegioesMesoRegiaoProUpd]
(
    @micRegMesRegID     int,
    @mesRegID           int,
    @micRegID           int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [ibge].[microRegioesMesoRegiao]
       SET [mesRegID]          = @mesRegID,
           [micRegID]          = @micRegID
     WHERE [micRegMesRegID] = @micRegMesRegID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[ibge.microRegioesMesoRegiaoProUpd]: Cannot update  in [ibge].[microRegioesMesoRegiao] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.microRegioesMesoRegiaoProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.microRegioesMesoRegiaoProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.microRegioesMesoRegiaoProUpd >>>'
go


