/* 
 * PROCEDURE: [cep.regioesSubRegioesProDel] 
 */

CREATE PROCEDURE [cep.regioesSubRegioesProDel]
(
    @regSubRegID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [cep].[regioesSubRegioes]
     WHERE [regSubRegID] = @regSubRegID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[cep.regioesSubRegioesProDel]: Cannot delete because foreign keys still exist in [cep].[regioesSubRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.regioesSubRegioesProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.regioesSubRegioesProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.regioesSubRegioesProDel >>>'
go


