/* 
 * PROCEDURE: [geo.subRegioesProIns] 
 */

CREATE PROCEDURE [geo.subRegioesProIns]
(
    @nome         varchar(64))
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [geo].[subRegioes]([nome])
    VALUES(@nome)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[geo.subRegioesProIns]: Cannot insert because primary key value not found in [geo].[subRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('geo.subRegioesProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.subRegioesProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.subRegioesProIns >>>'
go


