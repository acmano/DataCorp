/* 
 * PROCEDURE: [cep.subRegioes1ProDel] 
 */

CREATE PROCEDURE [cep.subRegioes1ProDel]
(
    @subRegID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [cep].[subRegioes]
     WHERE [subRegID] = @subRegID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[cep.subRegioes1ProDel]: Cannot delete because foreign keys still exist in [cep].[subRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.subRegioes1ProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.subRegioes1ProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.subRegioes1ProDel >>>'
go


