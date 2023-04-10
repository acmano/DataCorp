/* 
 * TRIGGER: [setoresSubSetoresTrgUpd] 
 */

CREATE TRIGGER [setoresSubSetoresTrgUpd] ON setoresSubSetores
FOR UPDATE AS
BEGIN
    DECLARE
        @setSubSetID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Child Update: RESTRICT

    IF (UPDATE(setID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM setores pr, inserted
          WHERE pr.setID = inserted.setID) != @Rows)
        BEGIN
            RAISERROR 30001 'setoresSubSetoresTrgUpdCannot update because primary key value not found in setores'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(subSetID))
    BEGIN
        SELECT @NullRows = COUNT(*)
          FROM inserted
          WHERE  inserted.subSetID IS NULL

        SELECT @ValidRows = COUNT(*)
          FROM subSetores pr, inserted
          WHERE pr.subSetID = inserted.subSetID

        IF (@NullRows + @ValidRows <> @Rows)
        BEGIN
            RAISERROR 30001 'setoresSubSetoresTrgUpdCannot update because primary key value not found in subSetores'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('setoresSubSetoresTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER setoresSubSetoresTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER setoresSubSetoresTrgUpd >>>'
go


