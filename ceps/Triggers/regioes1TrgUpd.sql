/* 
 * TRIGGER: [regioes1TrgUpd] 
 */

CREATE TRIGGER [regioes1TrgUpd] ON regioes
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
          FROM nacoesRegioes ch, deleted
          WHERE ch.regID = deleted.regID) != 0)
        BEGIN
            RAISERROR 30001 'regioes1TrgUpdCannot update because foreign keys still exist in nacoesRegioes'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(regID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM regioesContinentes ch, deleted
          WHERE ch.regID = deleted.regID) != 0)
        BEGIN
            RAISERROR 30001 'regioes1TrgUpdCannot update because foreign keys still exist in regioesContinentes'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(regID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM subRegioesRegioes ch, deleted
          WHERE ch.regID = deleted.regID) != 0)
        BEGIN
            RAISERROR 30001 'regioes1TrgUpdCannot update because foreign keys still exist in subRegioesRegioes'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(regID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM paisesRegioes ch, deleted
          WHERE ch.regID = deleted.regID) != 0)
        BEGIN
            RAISERROR 30001 'regioes1TrgUpdCannot update because foreign keys still exist in paisesRegioes'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('regioes1TrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER regioes1TrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER regioes1TrgUpd >>>'
go


