/* 
 * TRIGGER: [municipiosRegiaoImediataTrgIns] 
 */

CREATE TRIGGER [municipiosRegiaoImediataTrgIns] ON municipiosRegiaoImediata
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
         FROM regioesImediatas pr, inserted
         WHERE pr.regImeID = inserted.regImeID) != @Rows)
    BEGIN
        RAISERROR 30000 'municipiosRegiaoImediataTrgInsCannot insert because primary key value not found in regioesImediatas'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    SELECT @NullRows = COUNT(*)
        FROM inserted
        WHERE  inserted.munID IS NULL

    SELECT @ValidRows = COUNT(*)
        FROM municipios pr, inserted
        WHERE pr.munID = inserted.munID

    IF (@NullRows + @ValidRows <> @Rows)
    BEGIN
        RAISERROR 30000 'municipiosRegiaoImediataTrgInsCannot insert because primary key value not found in municipios'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('municipiosRegiaoImediataTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER municipiosRegiaoImediataTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER municipiosRegiaoImediataTrgIns >>>'
go


