/* 
 * PROCEDURE: [cep.enderecosProUpd] 
 */

CREATE PROCEDURE [cep.enderecosProUpd]
(
    @endID           int,
    @numero          int                     = NULL,
    @complemento     varchar(256)            = NULL,
    @caixaPostal     smallint                = NULL)
AS
BEGIN
    BEGIN TRAN

    UPDATE [cep].[enderecos]
       SET [numero]         = @numero,
           [complemento]    = @complemento,
           [caixaPostal]    = @caixaPostal
     WHERE [endID] = @endID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[cep.enderecosProUpd]: Cannot update  in [cep].[enderecos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.enderecosProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.enderecosProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.enderecosProUpd >>>'
go


