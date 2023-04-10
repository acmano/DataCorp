/* 
 * PROCEDURE: [ibge.mesoRegioesProUpd] 
 */

CREATE PROCEDURE [ibge.mesoRegioesProUpd]
(
    @mesRegID     int,
    @codigo       char(2),
    @nome         varchar(64),
    @area         decimal(10, 3))
AS
BEGIN
    BEGIN TRAN

    UPDATE [ibge].[mesoRegioes]
       SET [codigo]      = @codigo,
           [nome]        = @nome,
           [area]        = @area
     WHERE [mesRegID] = @mesRegID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[ibge.mesoRegioesProUpd]: Cannot update  in [ibge].[mesoRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.mesoRegioesProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.mesoRegioesProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.mesoRegioesProUpd >>>'
go


