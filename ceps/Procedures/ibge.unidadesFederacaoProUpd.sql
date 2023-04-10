/* 
 * PROCEDURE: [ibge.unidadesFederacaoProUpd] 
 */

CREATE PROCEDURE [ibge.unidadesFederacaoProUpd]
(
    @uniFedID     int,
    @codigo       char(2),
    @sigla        char(2),
    @nome         varchar(64),
    @area         decimal(10, 3))
AS
BEGIN
    BEGIN TRAN

    UPDATE [ibge].[unidadesFederacao]
       SET [codigo]      = @codigo,
           [sigla]       = @sigla,
           [nome]        = @nome,
           [area]        = @area
     WHERE [uniFedID] = @uniFedID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[ibge.unidadesFederacaoProUpd]: Cannot update  in [ibge].[unidadesFederacao] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('ibge.unidadesFederacaoProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.unidadesFederacaoProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.unidadesFederacaoProUpd >>>'
go


