/* 
 * TRIGGER: [microRegioesTrgUpd] 
 */

CREATE TRIGGER [microRegioesTrgUpd] ON microRegioes
FOR UPDATE AS
BEGIN
    DECLARE
        @micRegID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Update: RESTRICT

    IF (UPDATE(micRegID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM microRegioesMesoRegiao ch, deleted
          WHERE ch.micRegID = deleted.micRegID) != 0)
        BEGIN
            RAISERROR 30001 'microRegioesTrgUpdCannot update because foreign keys still exist in microRegioesMesoRegiao'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(micRegID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM municipiosMicroRegiao ch, deleted
          WHERE ch.micRegID = deleted.micRegID) != 0)
        BEGIN
            RAISERROR 30001 'microRegioesTrgUpdCannot update because foreign keys still exist in municipiosMicroRegiao'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('microRegioesTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER microRegioesTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER microRegioesTrgUpd >>>'
go


