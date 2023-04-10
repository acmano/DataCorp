/* 
 * TRIGGER: [subDistritosTrgUpd] 
 */

CREATE TRIGGER [subDistritosTrgUpd] ON subDistritos
FOR UPDATE AS
BEGIN
    DECLARE
        @subDisID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Update: RESTRICT

    IF (UPDATE(subDisID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM subDistritosDistrito ch, deleted
          WHERE ch.subDisID = deleted.subDisID) != 0)
        BEGIN
            RAISERROR 30001 'subDistritosTrgUpdCannot update because foreign keys still exist in subDistritosDistrito'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(subDisID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM subDistritosMunicipio ch, deleted
          WHERE ch.subDisID = deleted.subDisID) != 0)
        BEGIN
            RAISERROR 30001 'subDistritosTrgUpdCannot update because foreign keys still exist in subDistritosMunicipio'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(subDisID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM cepsSubDistritos ch, deleted
          WHERE ch.subDisID = deleted.subDisID) != 0)
        BEGIN
            RAISERROR 30001 'subDistritosTrgUpdCannot update because foreign keys still exist in cepsSubDistritos'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('subDistritosTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER subDistritosTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER subDistritosTrgUpd >>>'
go


