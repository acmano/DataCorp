/* 
 * PROCEDURE: [cep.sufixosTiposProDel] 
 */

CREATE PROCEDURE [cep.sufixosTiposProDel]
(
    @sufTipID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [cep].[sufixosTipos]
     WHERE [sufTipID] = @sufTipID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[cep.sufixosTiposProDel]: Cannot delete because foreign keys still exist in [cep].[sufixosTipos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.sufixosTiposProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.sufixosTiposProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.sufixosTiposProDel >>>'
go


