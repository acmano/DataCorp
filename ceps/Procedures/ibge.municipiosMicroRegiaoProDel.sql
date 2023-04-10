/* 
 * PROCEDURE: [ibge.municipiosMicroRegiaoProDel] 
 */

CREATE PROCEDURE [ibge.municipiosMicroRegiaoProDel]
(
    @munMicRegID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [ibge].[municipiosMicroRegiao]
     WHERE [munMicRegID] = @munMicRegID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[ibge.municipiosMicroRegiaoProDel]: Cannot delete because foreign keys still exist in [ibge].[municipiosMicroRegiao] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.municipiosMicroRegiaoProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.municipiosMicroRegiaoProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.municipiosMicroRegiaoProDel >>>'
go


