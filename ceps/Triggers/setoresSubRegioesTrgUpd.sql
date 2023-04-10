/* 
 * TRIGGER: [setoresSubRegioesTrgUpd] 
 */

CREATE TRIGGER [setoresSubRegioesTrgUpd] ON setoresSubRegioes
FOR UPDATE AS
BEGIN
    DECLARE
        @setSubRegID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Child Update: RESTRICT

    IF (UPDATE(subRegID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM subRegioes pr, inserted
          WHERE pr.subRegID = inserted.subRegID) != @Rows)
        BEGIN
            RAISERROR 30001 'setoresSubRegioesTrgUpdCannot update because primary key value not found in subRegioes'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(setID))
    BEGIN
        SELECT @NullRows = COUNT(*)
          FROM inserted
          WHERE  inserted.setID IS NULL

        SELECT @ValidRows = COUNT(*)
          FROM setores pr, inserted
          WHERE pr.setID = inserted.setID

        IF (@NullRows + @ValidRows <> @Rows)
        BEGIN
            RAISERROR 30001 'setoresSubRegioesTrgUpdCannot update because primary key value not found in setores'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('setoresSubRegioesTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER setoresSubRegioesTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER setoresSubRegioesTrgUpd >>>'
go


