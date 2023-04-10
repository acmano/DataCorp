/* 
 * PROCEDURE: [ibge.regiaoProUpd] 
 */

CREATE PROCEDURE [ibge.regiaoProUpd]
(
    @regID      int,
    @codigo     char(2),
    @nome       varchar(64),
    @sigla      char(2),
    @area       decimal(10, 3))
AS
BEGIN
    BEGIN TRAN

    UPDATE [ibge].[regiao]
       SET [codigo]    = @codigo,
           [nome]      = @nome,
           [sigla]     = @sigla,
           [area]      = @area
     WHERE [regID] = @regID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[ibge.regiaoProUpd]: Cannot update  in [ibge].[regiao] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.regiaoProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.regiaoProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.regiaoProUpd >>>'
go


