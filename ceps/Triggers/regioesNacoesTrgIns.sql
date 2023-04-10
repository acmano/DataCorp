/* 
 * TRIGGER: [regioesNacoesTrgIns] 
 */

CREATE TRIGGER [regioesNacoesTrgIns] ON regioesNacoes
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
         FROM nacoes pr, inserted
         WHERE pr.nacID = inserted.nacID) != @Rows)
    BEGIN
        RAISERROR 30000 'regioesNacoesTrgInsCannot insert because primary key value not found in nacoes'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    SELECT @NullRows = COUNT(*)
        FROM inserted
        WHERE  inserted.regID IS NULL

    SELECT @ValidRows = COUNT(*)
        FROM regiao pr, inserted
        WHERE pr.regID = inserted.regID

    IF (@NullRows + @ValidRows <> @Rows)
    BEGIN
        RAISERROR 30000 'regioesNacoesTrgInsCannot insert because primary key value not found in regiao'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('regioesNacoesTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER regioesNacoesTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER regioesNacoesTrgIns >>>'
go


