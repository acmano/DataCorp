/* 
 * TRIGGER: [cepsSubDistritosTrgIns] 
 */

CREATE TRIGGER [cepsSubDistritosTrgIns] ON cepsSubDistritos
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

    SELECT @NullRows = COUNT(*)
        FROM inserted
        WHERE  inserted.subDisID IS NULL

    SELECT @ValidRows = COUNT(*)
        FROM subDistritos pr, inserted
        WHERE pr.subDisID = inserted.subDisID

    IF (@NullRows + @ValidRows <> @Rows)
    BEGIN
        RAISERROR 30000 'cepsSubDistritosTrgInsCannot insert because primary key value not found in subDistritos'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    SELECT @NullRows = COUNT(*)
        FROM inserted
        WHERE  inserted.cepID IS NULL

    SELECT @ValidRows = COUNT(*)
        FROM ceps pr, inserted
        WHERE pr.cepID = inserted.cepID

    IF (@NullRows + @ValidRows <> @Rows)
    BEGIN
        RAISERROR 30000 'cepsSubDistritosTrgInsCannot insert because primary key value not found in ceps'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('cepsSubDistritosTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER cepsSubDistritosTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER cepsSubDistritosTrgIns >>>'
go


