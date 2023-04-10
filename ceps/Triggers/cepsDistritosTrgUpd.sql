/* 
 * TRIGGER: [cepsDistritosTrgUpd] 
 */

CREATE TRIGGER [cepsDistritosTrgUpd] ON cepsDistritos
FOR UPDATE AS
BEGIN
    DECLARE
        @cepDisID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Child Update: RESTRICT

    IF (UPDATE(disID))
    BEGIN
        SELECT @NullRows = COUNT(*)
          FROM inserted
          WHERE  inserted.disID IS NULL

        SELECT @ValidRows = COUNT(*)
          FROM distritos pr, inserted
          WHERE pr.disID = inserted.disID

        IF (@NullRows + @ValidRows <> @Rows)
        BEGIN
            RAISERROR 30001 'cepsDistritosTrgUpdCannot update because primary key value not found in distritos'
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
            RAISERROR 30001 'cepsDistritosTrgUpdCannot update because primary key value not found in ceps'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('cepsDistritosTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER cepsDistritosTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER cepsDistritosTrgUpd >>>'
go


