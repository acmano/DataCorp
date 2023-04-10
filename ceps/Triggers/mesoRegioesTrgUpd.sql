/* 
 * TRIGGER: [mesoRegioesTrgUpd] 
 */

CREATE TRIGGER [mesoRegioesTrgUpd] ON mesoRegioes
FOR UPDATE AS
BEGIN
    DECLARE
        @mesRegID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Update: RESTRICT

    IF (UPDATE(mesRegID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM mesoRegioesUnidadeFederacao ch, deleted
          WHERE ch.mesRegID = deleted.mesRegID) != 0)
        BEGIN
            RAISERROR 30001 'mesoRegioesTrgUpdCannot update because foreign keys still exist in mesoRegioesUnidadeFederacao'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(mesRegID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM microRegioesMesoRegiao ch, deleted
          WHERE ch.mesRegID = deleted.mesRegID) != 0)
        BEGIN
            RAISERROR 30001 'mesoRegioesTrgUpdCannot update because foreign keys still exist in microRegioesMesoRegiao'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('mesoRegioesTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER mesoRegioesTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER mesoRegioesTrgUpd >>>'
go


