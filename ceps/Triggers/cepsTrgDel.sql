/* 
 * TRIGGER: [cepsTrgDel] 
 */

CREATE TRIGGER [cepsTrgDel] ON ceps
FOR DELETE AS
BEGIN
    DECLARE
        @Rows      int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM cepsLogradouros ch, deleted
         WHERE ch.cepID = deleted.cepID) != 0)
    BEGIN
        RAISERROR 30002 'cepsTrgDelCannot delete because foreign keys still exist in cepsLogradouros'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM cepsDistritos ch, deleted
         WHERE ch.cepID = deleted.cepID) != 0)
    BEGIN
        RAISERROR 30002 'cepsTrgDelCannot delete because foreign keys still exist in cepsDistritos'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM cepsSubDistritos ch, deleted
         WHERE ch.cepID = deleted.cepID) != 0)
    BEGIN
        RAISERROR 30002 'cepsTrgDelCannot delete because foreign keys still exist in cepsSubDistritos'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM cepsMunicipios ch, deleted
         WHERE ch.cepID = deleted.cepID) != 0)
    BEGIN
        RAISERROR 30002 'cepsTrgDelCannot delete because foreign keys still exist in cepsMunicipios'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('cepsTrgDel') IS NOT NULL
    PRINT '<<< CREATED TRIGGER cepsTrgDel >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER cepsTrgDel >>>'
go


