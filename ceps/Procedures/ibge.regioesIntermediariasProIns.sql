/* 
 * PROCEDURE: [ibge.regioesIntermediariasProIns] 
 */

CREATE PROCEDURE [ibge.regioesIntermediariasProIns]
(
    @codigo       char(4),
    @nome         varchar(64),
    @area         decimal(10, 3))
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [ibge].[regioesIntermediarias]([codigo],
                                               [nome],
                                               [area])
    VALUES(@codigo,
           @nome,
           @area)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[ibge.regioesIntermediariasProIns]: Cannot insert because primary key value not found in [ibge].[regioesIntermediarias] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('ibge.regioesIntermediariasProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.regioesIntermediariasProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.regioesIntermediariasProIns >>>'
go


