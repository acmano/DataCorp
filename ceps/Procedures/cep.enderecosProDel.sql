/* 
 * PROCEDURE: [cep.enderecosProDel] 
 */

CREATE PROCEDURE [cep.enderecosProDel]
(
    @endID           int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [cep].[enderecos]
     WHERE [endID] = @endID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[cep.enderecosProDel]: Cannot delete because foreign keys still exist in [cep].[enderecos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.enderecosProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.enderecosProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.enderecosProDel >>>'
go


