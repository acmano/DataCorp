/* 
 * PROCEDURE: [ibge.microRegioesProIns] 
 */

CREATE PROCEDURE [ibge.microRegioesProIns]
(
    @codigo       char(3),
    @nome         varchar(64),
    @area         decimal(10, 3))
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [ibge].[microRegioes]([codigo],
                                      [nome],
                                      [area])
    VALUES(@codigo,
           @nome,
           @area)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[ibge.microRegioesProIns]: Cannot insert because primary key value not found in [ibge].[microRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('ibge.microRegioesProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.microRegioesProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.microRegioesProIns >>>'
go


