/* 
 * PROCEDURE: [geo.nacoesProIns] 
 */

CREATE PROCEDURE [geo.nacoesProIns]
(
    @m49           int,
    @isoAlpha2     char(2)                     = NULL,
    @isoAlpha3     char(3)                     = NULL,
    @latitude      double precision            = NULL,
    @longitude     double precision            = NULL)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [geo].[nacoes]([m49],
                               [isoAlpha2],
                               [isoAlpha3],
                               [latitude],
                               [longitude])
    VALUES(@m49,
           @isoAlpha2,
           @isoAlpha3,
           @latitude,
           @longitude)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[geo.nacoesProIns]: Cannot insert because primary key value not found in [geo].[nacoes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('geo.nacoesProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.nacoesProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.nacoesProIns >>>'
go


