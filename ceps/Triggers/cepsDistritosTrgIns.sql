/* 
 * TRIGGER: [cepsDistritosTrgIns] 
 */

CREATE TRIGGER [cepsDistritosTrgIns] ON cepsDistritos
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
        WHERE  inserted.disID IS NULL

    SELECT @ValidRows = COUNT(*)
        FROM distritos pr, inserted
        WHERE pr.disID = inserted.disID

    IF (@NullRows + @ValidRows <> @Rows)
    BEGIN
        RAISERROR 30000 'cepsDistritosTrgInsCannot insert because primary key value not found in distritos'
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
        RAISERROR 30000 'cepsDistritosTrgInsCannot insert because primary key value not found in ceps'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('cepsDistritosTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER cepsDistritosTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER cepsDistritosTrgIns >>>'
go


