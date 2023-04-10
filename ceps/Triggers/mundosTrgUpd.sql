/* 
 * TRIGGER: [mundosTrgUpd] 
 */

CREATE TRIGGER [mundosTrgUpd] ON mundos
FOR UPDATE AS
BEGIN
    DECLARE
        @munID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Update: RESTRICT

    IF (UPDATE(munID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM nacoesMundos ch, deleted
          WHERE ch.munID = deleted.munID) != 0)
        BEGIN
            RAISERROR 30001 'mundosTrgUpdCannot update because foreign keys still exist in nacoesMundos'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(munID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM continentesMundos ch, deleted
          WHERE ch.munID = deleted.munID) != 0)
        BEGIN
            RAISERROR 30001 'mundosTrgUpdCannot update because foreign keys still exist in continentesMundos'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('mundosTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER mundosTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER mundosTrgUpd >>>'
go


