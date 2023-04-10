/* 
 * TRIGGER: [municipiosTrgDel] 
 */

CREATE TRIGGER [municipiosTrgDel] ON municipios
FOR DELETE AS
BEGIN
    DECLARE
        @Rows      int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM municipiosRegiaoImediata ch, deleted
         WHERE ch.munID = deleted.munID) != 0)
    BEGIN
        RAISERROR 30002 'municipiosTrgDelCannot delete because foreign keys still exist in municipiosRegiaoImediata'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM municipiosMicroRegiao ch, deleted
         WHERE ch.munID = deleted.munID) != 0)
    BEGIN
        RAISERROR 30002 'municipiosTrgDelCannot delete because foreign keys still exist in municipiosMicroRegiao'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM distritosMunicipio ch, deleted
         WHERE ch.munID = deleted.munID) != 0)
    BEGIN
        RAISERROR 30002 'municipiosTrgDelCannot delete because foreign keys still exist in distritosMunicipio'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM subDistritosMunicipio ch, deleted
         WHERE ch.munID = deleted.munID) != 0)
    BEGIN
        RAISERROR 30002 'municipiosTrgDelCannot delete because foreign keys still exist in subDistritosMunicipio'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM cepsMunicipios ch, deleted
         WHERE ch.munID = deleted.munID) != 0)
    BEGIN
        RAISERROR 30002 'municipiosTrgDelCannot delete because foreign keys still exist in cepsMunicipios'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('municipiosTrgDel') IS NOT NULL
    PRINT '<<< CREATED TRIGGER municipiosTrgDel >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER municipiosTrgDel >>>'
go


