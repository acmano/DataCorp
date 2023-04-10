/* 
 * TRIGGER: [nacoesTrgDel] 
 */

CREATE TRIGGER [nacoesTrgDel] ON nacoes
FOR DELETE AS
BEGIN
    DECLARE
        @Rows      int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM nacoesMundos ch, deleted
         WHERE ch.nacID = deleted.nacID) != 0)
    BEGIN
        RAISERROR 30002 'nacoesTrgDelCannot delete because foreign keys still exist in nacoesMundos'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM nacoesContinentes ch, deleted
         WHERE ch.nacID = deleted.nacID) != 0)
    BEGIN
        RAISERROR 30002 'nacoesTrgDelCannot delete because foreign keys still exist in nacoesContinentes'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM nacoesRegioes ch, deleted
         WHERE ch.nacID = deleted.nacID) != 0)
    BEGIN
        RAISERROR 30002 'nacoesTrgDelCannot delete because foreign keys still exist in nacoesRegioes'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM nacoesSubRegioes ch, deleted
         WHERE ch.nacID = deleted.nacID) != 0)
    BEGIN
        RAISERROR 30002 'nacoesTrgDelCannot delete because foreign keys still exist in nacoesSubRegioes'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM nacoesPaises ch, deleted
         WHERE ch.nacID = deleted.nacID) != 0)
    BEGIN
        RAISERROR 30002 'nacoesTrgDelCannot delete because foreign keys still exist in nacoesPaises'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM regioesNacoes ch, deleted
         WHERE ch.nacID = deleted.nacID) != 0)
    BEGIN
        RAISERROR 30002 'nacoesTrgDelCannot delete because foreign keys still exist in regioesNacoes'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('nacoesTrgDel') IS NOT NULL
    PRINT '<<< CREATED TRIGGER nacoesTrgDel >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER nacoesTrgDel >>>'
go


