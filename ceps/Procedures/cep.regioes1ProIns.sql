/* 
 * PROCEDURE: [cep.regioes1ProIns] 
 */

CREATE PROCEDURE [cep.regioes1ProIns]
(
    @codigo        char(2),
    @nome          varchar(64),
    @cobertura     varchar(64))
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [cep].[regioes]([codigo],
                                [nome],
                                [cobertura])
    VALUES(@codigo,
           @nome,
           @cobertura)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[cep.regioes1ProIns]: Cannot insert because primary key value not found in [cep].[regioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('cep.regioes1ProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.regioes1ProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.regioes1ProIns >>>'
go


