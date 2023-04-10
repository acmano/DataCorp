/* 
 * PROCEDURE: [geo.paisesProIns] 
 */

CREATE PROCEDURE [geo.paisesProIns]
(
    @nome      varchar(64))
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [geo].[paises]([nome])
    VALUES(@nome)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[geo.paisesProIns]: Cannot insert because primary key value not found in [geo].[paises] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('geo.paisesProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.paisesProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.paisesProIns >>>'
go


