/* 
 * TRIGGER: [cepsTrgIns] 
 */

CREATE TRIGGER [cepsTrgIns] ON ceps
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
         FROM subSetorDivisoes pr, inserted
         WHERE pr.subSetDivID = inserted.subSetDivID) != @Rows)
    BEGIN
        RAISERROR 30000 'cepsTrgInsCannot insert because primary key value not found in subSetorDivisoes'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    SELECT @NullRows = COUNT(*)
        FROM inserted
        WHERE  inserted.sufID IS NULL

    SELECT @ValidRows = COUNT(*)
        FROM sufixos pr, inserted
        WHERE pr.sufID = inserted.sufID

    IF (@NullRows + @ValidRows <> @Rows)
    BEGIN
        RAISERROR 30000 'cepsTrgInsCannot insert because primary key value not found in sufixos'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('cepsTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER cepsTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER cepsTrgIns >>>'
go


