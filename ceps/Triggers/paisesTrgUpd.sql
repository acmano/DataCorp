/* 
 * TRIGGER: [paisesTrgUpd] 
 */

CREATE TRIGGER [paisesTrgUpd] ON paises
FOR UPDATE AS
BEGIN
    DECLARE
        @paiID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Update: RESTRICT

    IF (UPDATE(paiID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM paisesSubRegioes ch, deleted
          WHERE ch.paiID = deleted.paiID) != 0)
        BEGIN
            RAISERROR 30001 'paisesTrgUpdCannot update because foreign keys still exist in paisesSubRegioes'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(paiID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM nacoesPaises ch, deleted
          WHERE ch.paiID = deleted.paiID) != 0)
        BEGIN
            RAISERROR 30001 'paisesTrgUpdCannot update because foreign keys still exist in nacoesPaises'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(paiID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM paisesRegioes ch, deleted
          WHERE ch.paiID = deleted.paiID) != 0)
        BEGIN
            RAISERROR 30001 'paisesTrgUpdCannot update because foreign keys still exist in paisesRegioes'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('paisesTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER paisesTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER paisesTrgUpd >>>'
go


