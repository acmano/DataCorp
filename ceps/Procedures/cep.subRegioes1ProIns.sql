/* 
 * PROCEDURE: [cep.subRegioes1ProIns] 
 */

CREATE PROCEDURE [cep.subRegioes1ProIns]
(
    @codigo       char(2),
    @nome         varchar(64))
AS
BEGIN
    BEGIN TRAN

    INSERT INTO [cep].[subRegioes]([codigo],
                                   [nome])
    VALUES(@codigo,
           @nome)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 '[cep.subRegioes1ProIns]: Cannot insert because primary key value not found in [cep].[subRegioes] '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
go
IF OBJECT_ID('cep.subRegioes1ProIns') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE cep.subRegioes1ProIns >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE cep.subRegioes1ProIns >>>'
go


