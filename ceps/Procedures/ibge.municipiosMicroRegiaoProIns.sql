/* 
 * PROCEDURE: [ibge.municipiosMicroRegiaoProIns] 
 */

CREATE PROCEDURE [ibge.municipiosMicroRegiaoProIns]
(
    @micRegID        int,
    @munID           int)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [ibge].[municipiosMicroRegiao]([micRegID],
                                               [munID])
    VALUES(@micRegID,
           @munID)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[ibge.municipiosMicroRegiaoProIns]: Cannot insert because primary key value not found in [ibge].[municipiosMicroRegiao] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('ibge.municipiosMicroRegiaoProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.municipiosMicroRegiaoProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.municipiosMicroRegiaoProIns >>>'
go


