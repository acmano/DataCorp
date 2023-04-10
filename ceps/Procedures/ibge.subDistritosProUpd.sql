/* 
 * PROCEDURE: [ibge.subDistritosProUpd] 
 */

CREATE PROCEDURE [ibge.subDistritosProUpd]
(
    @subDisID           int,
    @codigo             char(2),
    @codigoCompleto     char(11),
    @nome               varchar(64))
AS
BEGIN
    BEGIN TRAN

    UPDATE [ibge].[subDistritos]
       SET [codigo]            = @codigo,
           [codigoCompleto]    = @codigoCompleto,
           [nome]              = @nome
     WHERE [subDisID] = @subDisID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[ibge.subDistritosProUpd]: Cannot update  in [ibge].[subDistritos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.subDistritosProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.subDistritosProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.subDistritosProUpd >>>'
go


