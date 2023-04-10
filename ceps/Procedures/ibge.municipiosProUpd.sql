/* 
 * PROCEDURE: [ibge.municipiosProUpd] 
 */

CREATE PROCEDURE [ibge.municipiosProUpd]
(
    @munID      int,
    @codigo     char(7),
    @nome       varchar(64),
    @area       decimal(10, 3))
AS
BEGIN
    BEGIN TRAN

    UPDATE [ibge].[municipios]
       SET [codigo]    = @codigo,
           [nome]      = @nome,
           [area]      = @area
     WHERE [munID] = @munID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[ibge.municipiosProUpd]: Cannot update  in [ibge].[municipios] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.municipiosProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.municipiosProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.municipiosProUpd >>>'
go


