/* 
 * TRIGGER: [subSetorDivisoesSubSetoresTrgIns] 
 */

CREATE TRIGGER [subSetorDivisoesSubSetoresTrgIns] ON subSetorDivisoesSubSetores
FOR INSERT AS
BEGIN
    DECLARE
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Child Insert: RESTRICT

    IF ((SELECT COUNT(*)
         FROM subSetores pr, inserted
         WHERE pr.subSetID = inserted.subSetID) != @Rows)
    BEGIN
        RAISERROR 30000 'subSetorDivisoesSubSetoresTrgInsCannot insert because primary key value not found in subSetores'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    SELECT @NullRows = COUNT(*)
        FROM inserted
        WHERE  inserted.subSetDivID IS NULL

    SELECT @ValidRows = COUNT(*)
        FROM subSetorDivisoes pr, inserted
        WHERE pr.subSetDivID = inserted.subSetDivID

    IF (@NullRows + @ValidRows <> @Rows)
    BEGIN
        RAISERROR 30000 'subSetorDivisoesSubSetoresTrgInsCannot insert because primary key value not found in subSetorDivisoes'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('subSetorDivisoesSubSetoresTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER subSetorDivisoesSubSetoresTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER subSetorDivisoesSubSetoresTrgIns >>>'
go


