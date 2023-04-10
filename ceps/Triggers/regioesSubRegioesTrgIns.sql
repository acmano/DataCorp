/* 
 * TRIGGER: [regioesSubRegioesTrgIns] 
 */

CREATE TRIGGER [regioesSubRegioesTrgIns] ON regioesSubRegioes
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
         FROM regioes pr, inserted
         WHERE pr.regID = inserted.regID) != @Rows)
    BEGIN
        RAISERROR 30000 'regioesSubRegioesTrgInsCannot insert because primary key value not found in regioes'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    SELECT @NullRows = COUNT(*)
        FROM inserted
        WHERE  inserted.subRegID IS NULL

    SELECT @ValidRows = COUNT(*)
        FROM subRegioes pr, inserted
        WHERE pr.subRegID = inserted.subRegID

    IF (@NullRows + @ValidRows <> @Rows)
    BEGIN
        RAISERROR 30000 'regioesSubRegioesTrgInsCannot insert because primary key value not found in subRegioes'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('regioesSubRegioesTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER regioesSubRegioesTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER regioesSubRegioesTrgIns >>>'
go


