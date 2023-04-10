/* 
 * PROCEDURE: [geo.nacoesProUpd] 
 */

CREATE PROCEDURE [geo.nacoesProUpd]
(
    @nacID         int,
    @m49           int,
    @isoAlpha2     char(2)                     = NULL,
    @isoAlpha3     char(3)                     = NULL,
    @latitude      double precision            = NULL,
    @longitude     double precision            = NULL)
AS
BEGIN
    BEGIN TRAN

    UPDATE [geo].[nacoes]
       SET [m49]          = @m49,
           [isoAlpha2]    = @isoAlpha2,
           [isoAlpha3]    = @isoAlpha3,
           [latitude]     = @latitude,
           [longitude]    = @longitude
     WHERE [nacID] = @nacID

    IF (@@error!=0)
    BEGIN
        RAISERROR  20001 '[geo.nacoesProUpd]: Cannot update  in [geo].[nacoes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

    RETURN(0)
END
go
IF OBJECT_ID('geo.nacoesProUpd') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE geo.nacoesProUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE geo.nacoesProUpd >>>'
go


