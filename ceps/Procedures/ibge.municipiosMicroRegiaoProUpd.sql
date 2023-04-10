/* 
 * PROCEDURE: [ibge.municipiosMicroRegiaoProUpd] 
 */

CREATE PROCEDURE [ibge.municipiosMicroRegiaoProUpd]
(
    @munMicRegID     int,
    @micRegID        int,
    @munID           int)
AS
BEGIN
    BEGIN TRAN

    UPDATE [ibge].[municipiosMicroRegiao]
       SET [micRegID]       = @micRegID,
           [munID]          = @munID
     WHERE [munMicRegID] = @munMicRegID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[ibge.municipiosMicroRegiaoProUpd]: Cannot update  in [ibge].[municipiosMicroRegiao] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.municipiosMicroRegiaoProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.municipiosMicroRegiaoProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.municipiosMicroRegiaoProUpd >>>'
go


