/* 
 * PROCEDURE: [ibge.microRegioesMesoRegiaoProDel] 
 */

CREATE PROCEDURE [ibge.microRegioesMesoRegiaoProDel]
(
    @micRegMesRegID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [ibge].[microRegioesMesoRegiao]
     WHERE [micRegMesRegID] = @micRegMesRegID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[ibge.microRegioesMesoRegiaoProDel]: Cannot delete because foreign keys still exist in [ibge].[microRegioesMesoRegiao] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.microRegioesMesoRegiaoProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.microRegioesMesoRegiaoProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.microRegioesMesoRegiaoProDel >>>'
go


