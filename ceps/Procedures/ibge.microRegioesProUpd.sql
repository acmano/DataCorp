/* 
 * PROCEDURE: [ibge.microRegioesProUpd] 
 */

CREATE PROCEDURE [ibge.microRegioesProUpd]
(
    @micRegID     int,
    @codigo       char(3),
    @nome         varchar(64),
    @area         decimal(10, 3))
AS
BEGIN
    BEGIN TRAN

    UPDATE [ibge].[microRegioes]
       SET [codigo]      = @codigo,
           [nome]        = @nome,
           [area]        = @area
     WHERE [micRegID] = @micRegID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[ibge.microRegioesProUpd]: Cannot update  in [ibge].[microRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.microRegioesProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.microRegioesProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.microRegioesProUpd >>>'
go


