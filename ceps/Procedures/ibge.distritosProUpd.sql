/* 
 * PROCEDURE: [ibge.distritosProUpd] 
 */

CREATE PROCEDURE [ibge.distritosProUpd]
(
    @disID              int,
    @codigo             char(2),
    @codigoCompleto     char(9),
    @nome               varchar(64))
AS
BEGIN
    BEGIN TRAN

    UPDATE [ibge].[distritos]
       SET [codigo]            = @codigo,
           [codigoCompleto]    = @codigoCompleto,
           [nome]              = @nome
     WHERE [disID] = @disID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[ibge.distritosProUpd]: Cannot update  in [ibge].[distritos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.distritosProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.distritosProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.distritosProUpd >>>'
go


