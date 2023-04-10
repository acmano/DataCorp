/* 
 * TRIGGER: [setoresSubRegioesTrgIns] 
 */

CREATE TRIGGER [setoresSubRegioesTrgIns] ON setoresSubRegioes
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
         FROM subRegioes pr, inserted
         WHERE pr.subRegID = inserted.subRegID) != @Rows)
    BEGIN
        RAISERROR 30000 'setoresSubRegioesTrgInsCannot insert because primary key value not found in subRegioes'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    SELECT @NullRows = COUNT(*)
        FROM inserted
        WHERE  inserted.setID IS NULL

    SELECT @ValidRows = COUNT(*)
        FROM setores pr, inserted
        WHERE pr.setID = inserted.setID

    IF (@NullRows + @ValidRows <> @Rows)
    BEGIN
        RAISERROR 30000 'setoresSubRegioesTrgInsCannot insert because primary key value not found in setores'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('setoresSubRegioesTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER setoresSubRegioesTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER setoresSubRegioesTrgIns >>>'
go


