/* 
 * PROCEDURE: [ibge.regioesIntermediariasProUpd] 
 */

CREATE PROCEDURE [ibge.regioesIntermediariasProUpd]
(
    @regIntID     int,
    @codigo       char(4),
    @nome         varchar(64),
    @area         decimal(10, 3))
AS
BEGIN
    BEGIN TRAN

    UPDATE [ibge].[regioesIntermediarias]
       SET [codigo]      = @codigo,
           [nome]        = @nome,
           [area]        = @area
     WHERE [regIntID] = @regIntID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[ibge.regioesIntermediariasProUpd]: Cannot update  in [ibge].[regioesIntermediarias] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.regioesIntermediariasProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.regioesIntermediariasProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.regioesIntermediariasProUpd >>>'
go


