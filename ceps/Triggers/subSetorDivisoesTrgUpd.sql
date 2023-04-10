/* 
 * TRIGGER: [subSetorDivisoesTrgUpd] 
 */

CREATE TRIGGER [subSetorDivisoesTrgUpd] ON subSetorDivisoes
FOR UPDATE AS
BEGIN
    DECLARE
        @subSetDivID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Update: RESTRICT

    IF (UPDATE(subSetDivID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM subSetorDivisoesSubSetores ch, deleted
          WHERE ch.subSetDivID = deleted.subSetDivID) != 0)
        BEGIN
            RAISERROR 30001 'subSetorDivisoesTrgUpdCannot update because foreign keys still exist in subSetorDivisoesSubSetores'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(subSetDivID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM ceps ch, deleted
          WHERE ch.subSetDivID = deleted.subSetDivID) != 0)
        BEGIN
            RAISERROR 30001 'subSetorDivisoesTrgUpdCannot update because foreign keys still exist in ceps'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('subSetorDivisoesTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER subSetorDivisoesTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER subSetorDivisoesTrgUpd >>>'
go


