/* 
 * TRIGGER: [municipiosRegiaoImediataTrgUpd] 
 */

CREATE TRIGGER [municipiosRegiaoImediataTrgUpd] ON municipiosRegiaoImediata
FOR UPDATE AS
BEGIN
    DECLARE
        @munRegImeID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Child Update: RESTRICT

    IF (UPDATE(regImeID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM regioesImediatas pr, inserted
          WHERE pr.regImeID = inserted.regImeID) != @Rows)
        BEGIN
            RAISERROR 30001 'municipiosRegiaoImediataTrgUpdCannot update because primary key value not found in regioesImediatas'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(munID))
    BEGIN
        SELECT @NullRows = COUNT(*)
          FROM inserted
          WHERE  inserted.munID IS NULL

        SELECT @ValidRows = COUNT(*)
          FROM municipios pr, inserted
          WHERE pr.munID = inserted.munID

        IF (@NullRows + @ValidRows <> @Rows)
        BEGIN
            RAISERROR 30001 'municipiosRegiaoImediataTrgUpdCannot update because primary key value not found in municipios'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('municipiosRegiaoImediataTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER municipiosRegiaoImediataTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER municipiosRegiaoImediataTrgUpd >>>'
go


