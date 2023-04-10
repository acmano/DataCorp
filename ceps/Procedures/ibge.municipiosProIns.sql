/* 
 * PROCEDURE: [ibge.municipiosProIns] 
 */

CREATE PROCEDURE [ibge.municipiosProIns]
(
    @codigo     char(7),
    @nome       varchar(64),
    @area       decimal(10, 3))
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [ibge].[municipios]([codigo],
                                    [nome],
                                    [area])
    VALUES(@codigo,
           @nome,
           @area)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[ibge.municipiosProIns]: Cannot insert because primary key value not found in [ibge].[municipios] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('ibge.municipiosProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.municipiosProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.municipiosProIns >>>'
go


