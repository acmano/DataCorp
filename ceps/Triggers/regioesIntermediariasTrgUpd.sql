/* 
 * TRIGGER: [regioesIntermediariasTrgUpd] 
 */

CREATE TRIGGER [regioesIntermediariasTrgUpd] ON regioesIntermediarias
FOR UPDATE AS
BEGIN
    DECLARE
        @regIntID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Update: RESTRICT

    IF (UPDATE(regIntID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM regioesIntermediariasUnidadeFederacao ch, deleted
          WHERE ch.regIntID = deleted.regIntID) != 0)
        BEGIN
            RAISERROR 30001 'regioesIntermediariasTrgUpdCannot update because foreign keys still exist in regioesIntermediariasUnidadeFederacao'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(regIntID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM regioesImediatasRegiaoIntermediaria ch, deleted
          WHERE ch.regIntID = deleted.regIntID) != 0)
        BEGIN
            RAISERROR 30001 'regioesIntermediariasTrgUpdCannot update because foreign keys still exist in regioesImediatasRegiaoIntermediaria'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('regioesIntermediariasTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER regioesIntermediariasTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER regioesIntermediariasTrgUpd >>>'
go


