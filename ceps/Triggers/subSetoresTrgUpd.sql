/* 
 * TRIGGER: [subSetoresTrgUpd] 
 */

CREATE TRIGGER [subSetoresTrgUpd] ON subSetores
FOR UPDATE AS
BEGIN
    DECLARE
        @subSetID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Update: RESTRICT

    IF (UPDATE(subSetID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM setoresSubSetores ch, deleted
          WHERE ch.subSetID = deleted.subSetID) != 0)
        BEGIN
            RAISERROR 30001 'subSetoresTrgUpdCannot update because foreign keys still exist in setoresSubSetores'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(subSetID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM subSetorDivisoesSubSetores ch, deleted
          WHERE ch.subSetID = deleted.subSetID) != 0)
        BEGIN
            RAISERROR 30001 'subSetoresTrgUpdCannot update because foreign keys still exist in subSetorDivisoesSubSetores'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('subSetoresTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER subSetoresTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER subSetoresTrgUpd >>>'
go


