/* 
 * PROCEDURE: [ibge.microRegioesMesoRegiaoProIns] 
 */

CREATE PROCEDURE [ibge.microRegioesMesoRegiaoProIns]
(
    @mesRegID           int,
    @micRegID           int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [ibge].[microRegioesMesoRegiao]([mesRegID],
                                                [micRegID])
    VALUES(@mesRegID,
           @micRegID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[ibge.microRegioesMesoRegiaoProIns]: Cannot insert because primary key value not found in [ibge].[microRegioesMesoRegiao] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('ibge.microRegioesMesoRegiaoProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.microRegioesMesoRegiaoProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.microRegioesMesoRegiaoProIns >>>'
go


