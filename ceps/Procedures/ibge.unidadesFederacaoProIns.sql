/* 
 * PROCEDURE: [ibge.unidadesFederacaoProIns] 
 */

CREATE PROCEDURE [ibge.unidadesFederacaoProIns]
(
    @codigo       char(2),
    @sigla        char(2),
    @nome         varchar(64),
    @area         decimal(10, 3))
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [ibge].[unidadesFederacao]([codigo],
                                           [sigla],
                                           [nome],
                                           [area])
    VALUES(@codigo,
           @sigla,
           @nome,
           @area)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[ibge.unidadesFederacaoProIns]: Cannot insert because primary key value not found in [ibge].[unidadesFederacao] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('ibge.unidadesFederacaoProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.unidadesFederacaoProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.unidadesFederacaoProIns >>>'
go


