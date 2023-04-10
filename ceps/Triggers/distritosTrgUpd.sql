/* 
 * TRIGGER: [distritosTrgUpd] 
 */

CREATE TRIGGER [distritosTrgUpd] ON distritos
FOR UPDATE AS
BEGIN
    DECLARE
        @disID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Update: RESTRICT

    IF (UPDATE(disID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM distritosMunicipio ch, deleted
          WHERE ch.disID = deleted.disID) != 0)
        BEGIN
            RAISERROR 30001 'distritosTrgUpdCannot update because foreign keys still exist in distritosMunicipio'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(disID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM subDistritosDistrito ch, deleted
          WHERE ch.disID = deleted.disID) != 0)
        BEGIN
            RAISERROR 30001 'distritosTrgUpdCannot update because foreign keys still exist in subDistritosDistrito'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(disID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM cepsDistritos ch, deleted
          WHERE ch.disID = deleted.disID) != 0)
        BEGIN
            RAISERROR 30001 'distritosTrgUpdCannot update because foreign keys still exist in cepsDistritos'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('distritosTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER distritosTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER distritosTrgUpd >>>'
go


