/* 
 * PROCEDURE: [ibge.regiaoProIns] 
 */

CREATE PROCEDURE [ibge.regiaoProIns]
(
    @codigo     char(2),
    @nome       varchar(64),
    @sigla      char(2),
    @area       decimal(10, 3))
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [ibge].[regiao]([codigo],
                                [nome],
                                [sigla],
                                [area])
    VALUES(@codigo,
           @nome,
           @sigla,
           @area)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[ibge.regiaoProIns]: Cannot insert because primary key value not found in [ibge].[regiao] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('ibge.regiaoProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.regiaoProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.regiaoProIns >>>'
go


