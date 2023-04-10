/* 
 * TRIGGER: [regioesImediatasRegiaoIntermediariaTrgIns] 
 */

CREATE TRIGGER [regioesImediatasRegiaoIntermediariaTrgIns] ON regioesImediatasRegiaoIntermediaria
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
         FROM regioesIntermediarias pr, inserted
         WHERE pr.regIntID = inserted.regIntID) != @Rows)
    BEGIN
        RAISERROR 30000 'regioesImediatasRegiaoIntermediariaTrgInsCannot insert because primary key value not found in regioesIntermediarias'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    SELECT @NullRows = COUNT(*)
        FROM inserted
        WHERE  inserted.regImeID IS NULL

    SELECT @ValidRows = COUNT(*)
        FROM regioesImediatas pr, inserted
        WHERE pr.regImeID = inserted.regImeID

    IF (@NullRows + @ValidRows <> @Rows)
    BEGIN
        RAISERROR 30000 'regioesImediatasRegiaoIntermediariaTrgInsCannot insert because primary key value not found in regioesImediatas'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('regioesImediatasRegiaoIntermediariaTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER regioesImediatasRegiaoIntermediariaTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER regioesImediatasRegiaoIntermediariaTrgIns >>>'
go


