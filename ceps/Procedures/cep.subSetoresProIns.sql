/* 
 * PROCEDURE: [cep.subSetoresProIns] 
 */

CREATE PROCEDURE [cep.subSetoresProIns]
(
    @codigo       char(4),
    @nome         varchar(64))
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [cep].[subSetores]([codigo],
                                   [nome])
    VALUES(@codigo,
           @nome)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[cep.subSetoresProIns]: Cannot insert because primary key value not found in [cep].[subSetores] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('cep.subSetoresProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.subSetoresProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.subSetoresProIns >>>'
go


