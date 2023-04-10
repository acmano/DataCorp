/* 
 * TRIGGER: [mesoRegioesTrgDel] 
 */

CREATE TRIGGER [mesoRegioesTrgDel] ON mesoRegioes
FOR DELETE AS
BEGIN
    DECLARE
        @Rows      int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM mesoRegioesUnidadeFederacao ch, deleted
         WHERE ch.mesRegID = deleted.mesRegID) != 0)
    BEGIN
        RAISERROR 30002 'mesoRegioesTrgDelCannot delete because foreign keys still exist in mesoRegioesUnidadeFederacao'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM microRegioesMesoRegiao ch, deleted
         WHERE ch.mesRegID = deleted.mesRegID) != 0)
    BEGIN
        RAISERROR 30002 'mesoRegioesTrgDelCannot delete because foreign keys still exist in microRegioesMesoRegiao'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('mesoRegioesTrgDel') IS NOT NULL
    PRINT '<<< CREATED TRIGGER mesoRegioesTrgDel >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER mesoRegioesTrgDel >>>'
go


