/* 
 * PROCEDURE: [geo.continentesMundosProDel] 
 */

CREATE PROCEDURE [geo.continentesMundosProDel]
(
    @ctnMunID     int)
AS
BEGIN
    BEGIN TRAN

    DELETE
      FROM [geo].[continentesMundos]
     WHERE [ctnMunID] = @ctnMunID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20002 '[geo.continentesMundosProDel]: Cannot delete because foreign keys still exist in [geo].[continentesMundos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.continentesMundosProDel') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.continentesMundosProDel >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.continentesMundosProDel >>>'
go


