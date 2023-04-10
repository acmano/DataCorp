/* 
 * PROCEDURE: [cep.cepsMunicipiosProDel] 
 */

CREATE PROCEDURE [cep.cepsMunicipiosProDel]
(
    @cepMunID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [cep].[cepsMunicipios]
     WHERE [cepMunID] = @cepMunID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[cep.cepsMunicipiosProDel]: Cannot delete because foreign keys still exist in [cep].[cepsMunicipios] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('cep.cepsMunicipiosProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.cepsMunicipiosProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.cepsMunicipiosProDel >>>'
go


