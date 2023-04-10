/* 
 * PROCEDURE: [geo.regioesProIns] 
 */

CREATE PROCEDURE [geo.regioesProIns]
(
    @nome      varchar(64))
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [geo].[regioes]([nome])
    VALUES(@nome)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[geo.regioesProIns]: Cannot insert because primary key value not found in [geo].[regioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('geo.regioesProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.regioesProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.regioesProIns >>>'
go


