/* 
 * TRIGGER: [regiaoTrgDel] 
 */

CREATE TRIGGER [regiaoTrgDel] ON regiao
FOR DELETE AS
BEGIN
    DECLARE
        @Rows      int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM unidadesFederacaoRegiao ch, deleted
         WHERE ch.regID = deleted.regID) != 0)
    BEGIN
        RAISERROR 30002 'regiaoTrgDelCannot delete because foreign keys still exist in unidadesFederacaoRegiao'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM regioesNacoes ch, deleted
         WHERE ch.regID = deleted.regID) != 0)
    BEGIN
        RAISERROR 30002 'regiaoTrgDelCannot delete because foreign keys still exist in regioesNacoes'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('regiaoTrgDel') IS NOT NULL
    PRINT '<<< CREATED TRIGGER regiaoTrgDel >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER regiaoTrgDel >>>'
go


