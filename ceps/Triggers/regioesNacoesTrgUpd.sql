/* 
 * TRIGGER: [regioesNacoesTrgUpd] 
 */

CREATE TRIGGER [regioesNacoesTrgUpd] ON regioesNacoes
FOR UPDATE AS
BEGIN
    DECLARE
        @regNacID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Child Update: RESTRICT

    IF (UPDATE(nacID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM nacoes pr, inserted
          WHERE pr.nacID = inserted.nacID) != @Rows)
        BEGIN
            RAISERROR 30001 'regioesNacoesTrgUpdCannot update because primary key value not found in nacoes'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(regID))
    BEGIN
        SELECT @NullRows = COUNT(*)
          FROM inserted
          WHERE  inserted.regID IS NULL

        SELECT @ValidRows = COUNT(*)
          FROM regiao pr, inserted
          WHERE pr.regID = inserted.regID

        IF (@NullRows + @ValidRows <> @Rows)
        BEGIN
            RAISERROR 30001 'regioesNacoesTrgUpdCannot update because primary key value not found in regiao'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('regioesNacoesTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER regioesNacoesTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER regioesNacoesTrgUpd >>>'
go


