/* 
 * PROCEDURE: [ibge.distritosMunicipioProUpd] 
 */

CREATE PROCEDURE [ibge.distritosMunicipioProUpd]
(
    @disMunID     int,
    @munID        int,
    @disID        int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [ibge].[distritosMunicipio]
       SET [munID]       = @munID,
           [disID]       = @disID
     WHERE [disMunID] = @disMunID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[ibge.distritosMunicipioProUpd]: Cannot update  in [ibge].[distritosMunicipio] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.distritosMunicipioProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.distritosMunicipioProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.distritosMunicipioProUpd >>>'
go


