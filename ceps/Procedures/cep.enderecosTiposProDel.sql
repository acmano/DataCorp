/* 
 * PROCEDURE: [cep.enderecosTiposProDel] 
 */

CREATE PROCEDURE [cep.enderecosTiposProDel]
(
    @endTipID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [cep].[enderecosTipos]
     WHERE [endTipID] = @endTipID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[cep.enderecosTiposProDel]: Cannot delete because foreign keys still exist in [cep].[enderecosTipos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.enderecosTiposProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.enderecosTiposProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.enderecosTiposProDel >>>'
go


