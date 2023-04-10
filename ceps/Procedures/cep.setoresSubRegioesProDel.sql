/* 
 * PROCEDURE: [cep.setoresSubRegioesProDel] 
 */

CREATE PROCEDURE [cep.setoresSubRegioesProDel]
(
    @setSubRegID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [cep].[setoresSubRegioes]
     WHERE [setSubRegID] = @setSubRegID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[cep.setoresSubRegioesProDel]: Cannot delete because foreign keys still exist in [cep].[setoresSubRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.setoresSubRegioesProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.setoresSubRegioesProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.setoresSubRegioesProDel >>>'
go


