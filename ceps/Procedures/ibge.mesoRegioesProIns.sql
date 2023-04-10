/* 
 * PROCEDURE: [ibge.mesoRegioesProIns] 
 */

CREATE PROCEDURE [ibge.mesoRegioesProIns]
(
    @codigo       char(2),
    @nome         varchar(64),
    @area         decimal(10, 3))
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [ibge].[mesoRegioes]([codigo],
                                     [nome],
                                     [area])
    VALUES(@codigo,
           @nome,
           @area)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[ibge.mesoRegioesProIns]: Cannot insert because primary key value not found in [ibge].[mesoRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('ibge.mesoRegioesProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.mesoRegioesProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.mesoRegioesProIns >>>'
go


