/* 
 * PROCEDURE: [geo.mundosProIns] 
 */

CREATE PROCEDURE [geo.mundosProIns]
(
    @nome      varchar(64))
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [geo].[mundos]([nome])
    VALUES(@nome)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[geo.mundosProIns]: Cannot insert because primary key value not found in [geo].[mundos] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('geo.mundosProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.mundosProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.mundosProIns >>>'
go


