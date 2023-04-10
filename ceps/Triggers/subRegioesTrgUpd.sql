/* 
 * TRIGGER: [subRegioesTrgUpd] 
 */

CREATE TRIGGER [subRegioesTrgUpd] ON subRegioes
FOR UPDATE AS
BEGIN
    DECLARE
        @subRegID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Update: RESTRICT

    IF (UPDATE(subRegID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM regioesSubRegioes ch, deleted
          WHERE ch.subRegID = deleted.subRegID) != 0)
        BEGIN
            RAISERROR 30001 'subRegioesTrgUpdCannot update because foreign keys still exist in regioesSubRegioes'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(subRegID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM setoresSubRegioes ch, deleted
          WHERE ch.subRegID = deleted.subRegID) != 0)
        BEGIN
            RAISERROR 30001 'subRegioesTrgUpdCannot update because foreign keys still exist in setoresSubRegioes'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('subRegioesTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER subRegioesTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER subRegioesTrgUpd >>>'
go


