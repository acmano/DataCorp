/* 
 * TRIGGER: [microRegioesTrgDel] 
 */

CREATE TRIGGER [microRegioesTrgDel] ON microRegioes
FOR DELETE AS
BEGIN
    DECLARE
        @Rows      int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM microRegioesMesoRegiao ch, deleted
         WHERE ch.micRegID = deleted.micRegID) != 0)
    BEGIN
        RAISERROR 30002 'microRegioesTrgDelCannot delete because foreign keys still exist in microRegioesMesoRegiao'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM municipiosMicroRegiao ch, deleted
         WHERE ch.micRegID = deleted.micRegID) != 0)
    BEGIN
        RAISERROR 30002 'microRegioesTrgDelCannot delete because foreign keys still exist in municipiosMicroRegiao'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('microRegioesTrgDel') IS NOT NULL
    PRINT '<<< CREATED TRIGGER microRegioesTrgDel >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER microRegioesTrgDel >>>'
go


