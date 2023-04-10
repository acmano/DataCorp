/* 
 * TRIGGER: [regioesSubRegioesTrgUpd] 
 */

CREATE TRIGGER [regioesSubRegioesTrgUpd] ON regioesSubRegioes
FOR UPDATE AS
BEGIN
    DECLARE
        @regSubRegID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Child Update: RESTRICT

    IF (UPDATE(regID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM regioes pr, inserted
          WHERE pr.regID = inserted.regID) != @Rows)
        BEGIN
            RAISERROR 30001 'regioesSubRegioesTrgUpdCannot update because primary key value not found in regioes'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(subRegID))
    BEGIN
        SELECT @NullRows = COUNT(*)
          FROM inserted
          WHERE  inserted.subRegID IS NULL

        SELECT @ValidRows = COUNT(*)
          FROM subRegioes pr, inserted
          WHERE pr.subRegID = inserted.subRegID

        IF (@NullRows + @ValidRows <> @Rows)
        BEGIN
            RAISERROR 30001 'regioesSubRegioesTrgUpdCannot update because primary key value not found in subRegioes'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('regioesSubRegioesTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER regioesSubRegioesTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER regioesSubRegioesTrgUpd >>>'
go


