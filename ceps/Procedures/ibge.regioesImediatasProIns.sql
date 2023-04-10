/* 
 * PROCEDURE: [ibge.regioesImediatasProIns] 
 */

CREATE PROCEDURE [ibge.regioesImediatasProIns]
(
    @codigo       char(6),
    @nome         varchar(64),
    @area         decimal(10, 3))
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [ibge].[regioesImediatas]([codigo],
                                          [nome],
                                          [area])
    VALUES(@codigo,
           @nome,
           @area)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[ibge.regioesImediatasProIns]: Cannot insert because primary key value not found in [ibge].[regioesImediatas] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('ibge.regioesImediatasProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.regioesImediatasProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.regioesImediatasProIns >>>'
go


