/* 
 * PROCEDURE: [cep.sufixosTiposSufixosProDel] 
 */

CREATE PROCEDURE [cep.sufixosTiposSufixosProDel]
(
    @sufTipSufID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [cep].[sufixosTiposSufixos]
     WHERE [sufTipSufID] = @sufTipSufID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[cep.sufixosTiposSufixosProDel]: Cannot delete because foreign keys still exist in [cep].[sufixosTiposSufixos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.sufixosTiposSufixosProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.sufixosTiposSufixosProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.sufixosTiposSufixosProDel >>>'
go


