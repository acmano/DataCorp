/* 
 * PROCEDURE: [cep.sufixosTiposProIns] 
 */

CREATE PROCEDURE [cep.sufixosTiposProIns]
(
    @codigo       char(2),
    @nome         varchar(64))
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [cep].[sufixosTipos]([codigo],
                                     [nome])
    VALUES(@codigo,
           @nome)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[cep.sufixosTiposProIns]: Cannot insert because primary key value not found in [cep].[sufixosTipos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('cep.sufixosTiposProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.sufixosTiposProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.sufixosTiposProIns >>>'
go


