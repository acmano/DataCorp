/* 
 * TRIGGER: [subDistritosDistritoTrgIns] 
 */

CREATE TRIGGER [subDistritosDistritoTrgIns] ON subDistritosDistrito
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
         FROM distritos pr, inserted
         WHERE pr.disID = inserted.disID) != @Rows)
    BEGIN
        RAISERROR 30000 'subDistritosDistritoTrgInsCannot insert because primary key value not found in distritos'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    SELECT @NullRows = COUNT(*)
        FROM inserted
        WHERE  inserted.subDisID IS NULL

    SELECT @ValidRows = COUNT(*)
        FROM subDistritos pr, inserted
        WHERE pr.subDisID = inserted.subDisID

    IF (@NullRows + @ValidRows <> @Rows)
    BEGIN
        RAISERROR 30000 'subDistritosDistritoTrgInsCannot insert because primary key value not found in subDistritos'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('subDistritosDistritoTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER subDistritosDistritoTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER subDistritosDistritoTrgIns >>>'
go


