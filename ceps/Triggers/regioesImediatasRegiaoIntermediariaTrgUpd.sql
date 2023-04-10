/* 
 * TRIGGER: [regioesImediatasRegiaoIntermediariaTrgUpd] 
 */

CREATE TRIGGER [regioesImediatasRegiaoIntermediariaTrgUpd] ON regioesImediatasRegiaoIntermediaria
FOR UPDATE AS
BEGIN
    DECLARE
        @regImeRegIntID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Child Update: RESTRICT

    IF (UPDATE(regIntID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM regioesIntermediarias pr, inserted
          WHERE pr.regIntID = inserted.regIntID) != @Rows)
        BEGIN
            RAISERROR 30001 'regioesImediatasRegiaoIntermediariaTrgUpdCannot update because primary key value not found in regioesIntermediarias'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(regImeID))
    BEGIN
        SELECT @NullRows = COUNT(*)
          FROM inserted
          WHERE  inserted.regImeID IS NULL

        SELECT @ValidRows = COUNT(*)
          FROM regioesImediatas pr, inserted
          WHERE pr.regImeID = inserted.regImeID

        IF (@NullRows + @ValidRows <> @Rows)
        BEGIN
            RAISERROR 30001 'regioesImediatasRegiaoIntermediariaTrgUpdCannot update because primary key value not found in regioesImediatas'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('regioesImediatasRegiaoIntermediariaTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER regioesImediatasRegiaoIntermediariaTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER regioesImediatasRegiaoIntermediariaTrgUpd >>>'
go


