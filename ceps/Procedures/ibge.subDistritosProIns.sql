/* 
 * PROCEDURE: [ibge.subDistritosProIns] 
 */

CREATE PROCEDURE [ibge.subDistritosProIns]
(
    @codigo             char(2),
    @codigoCompleto     char(11),
    @nome               varchar(64))
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [ibge].[subDistritos]([codigo],
                                      [codigoCompleto],
                                      [nome])
    VALUES(@codigo,
           @codigoCompleto,
           @nome)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[ibge.subDistritosProIns]: Cannot insert because primary key value not found in [ibge].[subDistritos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('ibge.subDistritosProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE ibge.subDistritosProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE ibge.subDistritosProIns >>>'
go


