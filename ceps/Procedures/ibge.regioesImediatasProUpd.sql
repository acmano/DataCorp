/* 
 * PROCEDURE: [ibge.regioesImediatasProUpd] 
 */

CREATE PROCEDURE [ibge.regioesImediatasProUpd]
(
    @regImeID     int,
    @codigo       char(6),
    @nome         varchar(64),
    @area         decimal(10, 3))
AS
BEGIN
    BEGIN TRAN

    UPDATE [ibge].[regioesImediatas]
       SET [codigo]      = @codigo,
           [nome]        = @nome,
           [area]        = @area
     WHERE [regImeID] = @regImeID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[ibge.regioesImediatasProUpd]: Cannot update  in [ibge].[regioesImediatas] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.regioesImediatasProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.regioesImediatasProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.regioesImediatasProUpd >>>'
go


