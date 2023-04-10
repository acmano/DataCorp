/* 
 * TRIGGER: [regioesTrgUpd] 
 */

CREATE TRIGGER [regioesTrgUpd] ON regioes
FOR UPDATE AS
BEGIN
    DECLARE
        @regID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Update: RESTRICT

    IF (UPDATE(regID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM regioesSubRegioes ch, deleted
          WHERE ch.regID = deleted.regID) != 0)
        BEGIN
            RAISERROR 30001 'regioesTrgUpdCannot update because foreign keys still exist in regioesSubRegioes'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('regioesTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER regioesTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER regioesTrgUpd >>>'
go


