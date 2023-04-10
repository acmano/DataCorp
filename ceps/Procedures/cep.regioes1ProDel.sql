/* 
 * PROCEDURE: [cep.regioes1ProDel] 
 */

CREATE PROCEDURE [cep.regioes1ProDel]
(
    @regID         int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [cep].[regioes]
     WHERE [regID] = @regID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[cep.regioes1ProDel]: Cannot delete because foreign keys still exist in [cep].[regioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.regioes1ProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.regioes1ProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.regioes1ProDel >>>'
go


