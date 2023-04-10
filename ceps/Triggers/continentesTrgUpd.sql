/* 
 * TRIGGER: [continentesTrgUpd] 
 */

CREATE TRIGGER [continentesTrgUpd] ON continentes
FOR UPDATE AS
BEGIN
    DECLARE
        @ctnID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Update: RESTRICT

    IF (UPDATE(ctnID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM nacoesContinentes ch, deleted
          WHERE ch.ctnID = deleted.ctnID) != 0)
        BEGIN
            RAISERROR 30001 'continentesTrgUpdCannot update because foreign keys still exist in nacoesContinentes'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(ctnID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM continentesMundos ch, deleted
          WHERE ch.ctnID = deleted.ctnID) != 0)
        BEGIN
            RAISERROR 30001 'continentesTrgUpdCannot update because foreign keys still exist in continentesMundos'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(ctnID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM regioesContinentes ch, deleted
          WHERE ch.ctnID = deleted.ctnID) != 0)
        BEGIN
            RAISERROR 30001 'continentesTrgUpdCannot update because foreign keys still exist in regioesContinentes'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('continentesTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER continentesTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER continentesTrgUpd >>>'
go


