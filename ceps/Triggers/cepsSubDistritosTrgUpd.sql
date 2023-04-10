/* 
 * TRIGGER: [cepsSubDistritosTrgUpd] 
 */

CREATE TRIGGER [cepsSubDistritosTrgUpd] ON cepsSubDistritos
FOR UPDATE AS
BEGIN
    DECLARE
        @cepSubDisID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Child Update: RESTRICT

    IF (UPDATE(subDisID))
    BEGIN
        SELECT @NullRows = COUNT(*)
          FROM inserted
          WHERE  inserted.subDisID IS NULL

        SELECT @ValidRows = COUNT(*)
          FROM subDistritos pr, inserted
          WHERE pr.subDisID = inserted.subDisID

        IF (@NullRows + @ValidRows <> @Rows)
        BEGIN
            RAISERROR 30001 'cepsSubDistritosTrgUpdCannot update because primary key value not found in subDistritos'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(cepID))
    BEGIN
        SELECT @NullRows = COUNT(*)
          FROM inserted
          WHERE  inserted.cepID IS NULL

        SELECT @ValidRows = COUNT(*)
          FROM ceps pr, inserted
          WHERE pr.cepID = inserted.cepID

        IF (@NullRows + @ValidRows <> @Rows)
        BEGIN
            RAISERROR 30001 'cepsSubDistritosTrgUpdCannot update because primary key value not found in ceps'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('cepsSubDistritosTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER cepsSubDistritosTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER cepsSubDistritosTrgUpd >>>'
go


