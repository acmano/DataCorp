/* 
 * TRIGGER: [regioesImediatasTrgUpd] 
 */

CREATE TRIGGER [regioesImediatasTrgUpd] ON regioesImediatas
FOR UPDATE AS
BEGIN
    DECLARE
        @regImeID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Update: RESTRICT

    IF (UPDATE(regImeID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM municipiosRegiaoImediata ch, deleted
          WHERE ch.regImeID = deleted.regImeID) != 0)
        BEGIN
            RAISERROR 30001 'regioesImediatasTrgUpdCannot update because foreign keys still exist in municipiosRegiaoImediata'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(regImeID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM regioesImediatasRegiaoIntermediaria ch, deleted
          WHERE ch.regImeID = deleted.regImeID) != 0)
        BEGIN
            RAISERROR 30001 'regioesImediatasTrgUpdCannot update because foreign keys still exist in regioesImediatasRegiaoIntermediaria'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('regioesImediatasTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER regioesImediatasTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER regioesImediatasTrgUpd >>>'
go


