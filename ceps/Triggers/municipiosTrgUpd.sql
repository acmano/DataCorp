/* 
 * TRIGGER: [municipiosTrgUpd] 
 */

CREATE TRIGGER [municipiosTrgUpd] ON municipios
FOR UPDATE AS
BEGIN
    DECLARE
        @munID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Update: RESTRICT

    IF (UPDATE(munID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM municipiosRegiaoImediata ch, deleted
          WHERE ch.munID = deleted.munID) != 0)
        BEGIN
            RAISERROR 30001 'municipiosTrgUpdCannot update because foreign keys still exist in municipiosRegiaoImediata'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(munID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM municipiosMicroRegiao ch, deleted
          WHERE ch.munID = deleted.munID) != 0)
        BEGIN
            RAISERROR 30001 'municipiosTrgUpdCannot update because foreign keys still exist in municipiosMicroRegiao'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(munID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM distritosMunicipio ch, deleted
          WHERE ch.munID = deleted.munID) != 0)
        BEGIN
            RAISERROR 30001 'municipiosTrgUpdCannot update because foreign keys still exist in distritosMunicipio'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(munID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM subDistritosMunicipio ch, deleted
          WHERE ch.munID = deleted.munID) != 0)
        BEGIN
            RAISERROR 30001 'municipiosTrgUpdCannot update because foreign keys still exist in subDistritosMunicipio'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(munID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM cepsMunicipios ch, deleted
          WHERE ch.munID = deleted.munID) != 0)
        BEGIN
            RAISERROR 30001 'municipiosTrgUpdCannot update because foreign keys still exist in cepsMunicipios'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('municipiosTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER municipiosTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER municipiosTrgUpd >>>'
go


