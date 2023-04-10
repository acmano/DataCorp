/* 
 * PROCEDURE: [geo.continentesProIns] 
 */

CREATE PROCEDURE [geo.continentesProIns]
(
    @nome      varchar(64))
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [geo].[continentes]([nome])
    VALUES(@nome)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[geo.continentesProIns]: Cannot insert because primary key value not found in [geo].[continentes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('geo.continentesProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.continentesProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.continentesProIns >>>'
go


