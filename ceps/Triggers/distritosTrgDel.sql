/* 
 * TRIGGER: [distritosTrgDel] 
 */

CREATE TRIGGER [distritosTrgDel] ON distritos
FOR DELETE AS
BEGIN
    DECLARE
        @Rows      int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM distritosMunicipio ch, deleted
         WHERE ch.disID = deleted.disID) != 0)
    BEGIN
        RAISERROR 30002 'distritosTrgDelCannot delete because foreign keys still exist in distritosMunicipio'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM subDistritosDistrito ch, deleted
         WHERE ch.disID = deleted.disID) != 0)
    BEGIN
        RAISERROR 30002 'distritosTrgDelCannot delete because foreign keys still exist in subDistritosDistrito'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM cepsDistritos ch, deleted
         WHERE ch.disID = deleted.disID) != 0)
    BEGIN
        RAISERROR 30002 'distritosTrgDelCannot delete because foreign keys still exist in cepsDistritos'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('distritosTrgDel') IS NOT NULL
    PRINT '<<< CREATED TRIGGER distritosTrgDel >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER distritosTrgDel >>>'
go


