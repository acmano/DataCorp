/* 
 * TRIGGER: [subSetorDivisoesSubSetoresTrgUpd] 
 */

CREATE TRIGGER [subSetorDivisoesSubSetoresTrgUpd] ON subSetorDivisoesSubSetores
FOR UPDATE AS
BEGIN
    DECLARE
        @subSetDivSubSetID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Child Update: RESTRICT

    IF (UPDATE(subSetID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM subSetores pr, inserted
          WHERE pr.subSetID = inserted.subSetID) != @Rows)
        BEGIN
            RAISERROR 30001 'subSetorDivisoesSubSetoresTrgUpdCannot update because primary key value not found in subSetores'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(subSetDivID))
    BEGIN
        SELECT @NullRows = COUNT(*)
          FROM inserted
          WHERE  inserted.subSetDivID IS NULL

        SELECT @ValidRows = COUNT(*)
          FROM subSetorDivisoes pr, inserted
          WHERE pr.subSetDivID = inserted.subSetDivID

        IF (@NullRows + @ValidRows <> @Rows)
        BEGIN
            RAISERROR 30001 'subSetorDivisoesSubSetoresTrgUpdCannot update because primary key value not found in subSetorDivisoes'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('subSetorDivisoesSubSetoresTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER subSetorDivisoesSubSetoresTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER subSetorDivisoesSubSetoresTrgUpd >>>'
go


