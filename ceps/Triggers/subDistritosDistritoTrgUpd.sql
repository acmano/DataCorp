/* 
 * TRIGGER: [subDistritosDistritoTrgUpd] 
 */

CREATE TRIGGER [subDistritosDistritoTrgUpd] ON subDistritosDistrito
FOR UPDATE AS
BEGIN
    DECLARE
        @subDisDisID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Child Update: RESTRICT

    IF (UPDATE(disID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM distritos pr, inserted
          WHERE pr.disID = inserted.disID) != @Rows)
        BEGIN
            RAISERROR 30001 'subDistritosDistritoTrgUpdCannot update because primary key value not found in distritos'
            ROLLBACK TRAN
        END
    END
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
            RAISERROR 30001 'subDistritosDistritoTrgUpdCannot update because primary key value not found in subDistritos'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('subDistritosDistritoTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER subDistritosDistritoTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER subDistritosDistritoTrgUpd >>>'
go


