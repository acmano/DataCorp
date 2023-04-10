/* 
 * PROCEDURE: [cep.subSetorDivisoesProIns] 
 */

CREATE PROCEDURE [cep.subSetorDivisoesProIns]
(
    @codigo          char(5),
    @nome            varchar(64))
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [cep].[subSetorDivisoes]([codigo],
                                         [nome])
    VALUES(@codigo,
           @nome)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[cep.subSetorDivisoesProIns]: Cannot insert because primary key value not found in [cep].[subSetorDivisoes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('cep.subSetorDivisoesProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.subSetorDivisoesProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.subSetorDivisoesProIns >>>'
go


