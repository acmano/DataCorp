/* 
 * TRIGGER: [setoresSubSetoresTrgIns] 
 */

CREATE TRIGGER [setoresSubSetoresTrgIns] ON setoresSubSetores
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
         FROM setores pr, inserted
         WHERE pr.setID = inserted.setID) != @Rows)
    BEGIN
        RAISERROR 30000 'setoresSubSetoresTrgInsCannot insert because primary key value not found in setores'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    SELECT @NullRows = COUNT(*)
        FROM inserted
        WHERE  inserted.subSetID IS NULL

    SELECT @ValidRows = COUNT(*)
        FROM subSetores pr, inserted
        WHERE pr.subSetID = inserted.subSetID

    IF (@NullRows + @ValidRows <> @Rows)
    BEGIN
        RAISERROR 30000 'setoresSubSetoresTrgInsCannot insert because primary key value not found in subSetores'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('setoresSubSetoresTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER setoresSubSetoresTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER setoresSubSetoresTrgIns >>>'
go


