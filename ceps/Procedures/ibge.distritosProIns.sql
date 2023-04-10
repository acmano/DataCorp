/* 
 * PROCEDURE: [ibge.distritosProIns] 
 */

CREATE PROCEDURE [ibge.distritosProIns]
(
    @codigo             char(2),
    @codigoCompleto     char(9),
    @nome               varchar(64))
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [ibge].[distritos]([codigo],
                                   [codigoCompleto],
                                   [nome])
    VALUES(@codigo,
           @codigoCompleto,
           @nome)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[ibge.distritosProIns]: Cannot insert because primary key value not found in [ibge].[distritos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('ibge.distritosProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.distritosProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.distritosProIns >>>'
go


