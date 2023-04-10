/* 
 * TRIGGER: [nacoesTrgUpd] 
 */

CREATE TRIGGER [nacoesTrgUpd] ON nacoes
FOR UPDATE AS
BEGIN
    DECLARE
        @nacID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Update: RESTRICT

    IF (UPDATE(nacID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM nacoesMundos ch, deleted
          WHERE ch.nacID = deleted.nacID) != 0)
        BEGIN
            RAISERROR 30001 'nacoesTrgUpdCannot update because foreign keys still exist in nacoesMundos'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(nacID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM nacoesContinentes ch, deleted
          WHERE ch.nacID = deleted.nacID) != 0)
        BEGIN
            RAISERROR 30001 'nacoesTrgUpdCannot update because foreign keys still exist in nacoesContinentes'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(nacID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM nacoesRegioes ch, deleted
          WHERE ch.nacID = deleted.nacID) != 0)
        BEGIN
            RAISERROR 30001 'nacoesTrgUpdCannot update because foreign keys still exist in nacoesRegioes'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(nacID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM nacoesSubRegioes ch, deleted
          WHERE ch.nacID = deleted.nacID) != 0)
        BEGIN
            RAISERROR 30001 'nacoesTrgUpdCannot update because foreign keys still exist in nacoesSubRegioes'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(nacID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM nacoesPaises ch, deleted
          WHERE ch.nacID = deleted.nacID) != 0)
        BEGIN
            RAISERROR 30001 'nacoesTrgUpdCannot update because foreign keys still exist in nacoesPaises'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(nacID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM regioesNacoes ch, deleted
          WHERE ch.nacID = deleted.nacID) != 0)
        BEGIN
            RAISERROR 30001 'nacoesTrgUpdCannot update because foreign keys still exist in regioesNacoes'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('nacoesTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER nacoesTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER nacoesTrgUpd >>>'
go


