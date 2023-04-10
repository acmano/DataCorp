/* 
 * TRIGGER: [unidadesFederacaoTrgDel] 
 */

CREATE TRIGGER [unidadesFederacaoTrgDel] ON unidadesFederacao
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
         WHERE ch.uniFedID = deleted.uniFedID) != 0)
    BEGIN
        RAISERROR 30002 'unidadesFederacaoTrgDelCannot delete because foreign keys still exist in unidadesFederacaoRegiao'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM regioesIntermediariasUnidadeFederacao ch, deleted
         WHERE ch.uniFedID = deleted.uniFedID) != 0)
    BEGIN
        RAISERROR 30002 'unidadesFederacaoTrgDelCannot delete because foreign keys still exist in regioesIntermediariasUnidadeFederacao'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM mesoRegioesUnidadeFederacao ch, deleted
         WHERE ch.uniFedID = deleted.uniFedID) != 0)
    BEGIN
        RAISERROR 30002 'unidadesFederacaoTrgDelCannot delete because foreign keys still exist in mesoRegioesUnidadeFederacao'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('unidadesFederacaoTrgDel') IS NOT NULL
    PRINT '<<< CREATED TRIGGER unidadesFederacaoTrgDel >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER unidadesFederacaoTrgDel >>>'
go


