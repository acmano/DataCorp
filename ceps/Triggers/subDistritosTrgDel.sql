/* 
 * TRIGGER: [subDistritosTrgDel] 
 */

CREATE TRIGGER [subDistritosTrgDel] ON subDistritos
FOR DELETE AS
BEGIN
    DECLARE
        @Rows      int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM subDistritosDistrito ch, deleted
         WHERE ch.subDisID = deleted.subDisID) != 0)
    BEGIN
        RAISERROR 30002 'subDistritosTrgDelCannot delete because foreign keys still exist in subDistritosDistrito'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM subDistritosMunicipio ch, deleted
         WHERE ch.subDisID = deleted.subDisID) != 0)
    BEGIN
        RAISERROR 30002 'subDistritosTrgDelCannot delete because foreign keys still exist in subDistritosMunicipio'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM cepsSubDistritos ch, deleted
         WHERE ch.subDisID = deleted.subDisID) != 0)
    BEGIN
        RAISERROR 30002 'subDistritosTrgDelCannot delete because foreign keys still exist in cepsSubDistritos'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('subDistritosTrgDel') IS NOT NULL
    PRINT '<<< CREATED TRIGGER subDistritosTrgDel >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER subDistritosTrgDel >>>'
go


