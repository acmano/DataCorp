/* 
 * TRIGGER: [setoresTrgUpd] 
 */

CREATE TRIGGER [setoresTrgUpd] ON setores
FOR UPDATE AS
BEGIN
    DECLARE
        @setID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Update: RESTRICT

    IF (UPDATE(setID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM setoresSubRegioes ch, deleted
          WHERE ch.setID = deleted.setID) != 0)
        BEGIN
            RAISERROR 30001 'setoresTrgUpdCannot update because foreign keys still exist in setoresSubRegioes'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(setID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM setoresSubSetores ch, deleted
          WHERE ch.setID = deleted.setID) != 0)
        BEGIN
            RAISERROR 30001 'setoresTrgUpdCannot update because foreign keys still exist in setoresSubSetores'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('setoresTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER setoresTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER setoresTrgUpd >>>'
go


