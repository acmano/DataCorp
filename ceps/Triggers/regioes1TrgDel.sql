/* 
 * TRIGGER: [regioes1TrgDel] 
 */

CREATE TRIGGER [regioes1TrgDel] ON regioes
FOR DELETE AS
BEGIN
    DECLARE
        @Rows      int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM nacoesRegioes ch, deleted
         WHERE ch.regID = deleted.regID) != 0)
    BEGIN
        RAISERROR 30002 'regioes1TrgDelCannot delete because foreign keys still exist in nacoesRegioes'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM regioesContinentes ch, deleted
         WHERE ch.regID = deleted.regID) != 0)
    BEGIN
        RAISERROR 30002 'regioes1TrgDelCannot delete because foreign keys still exist in regioesContinentes'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM subRegioesRegioes ch, deleted
         WHERE ch.regID = deleted.regID) != 0)
    BEGIN
        RAISERROR 30002 'regioes1TrgDelCannot delete because foreign keys still exist in subRegioesRegioes'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM paisesRegioes ch, deleted
         WHERE ch.regID = deleted.regID) != 0)
    BEGIN
        RAISERROR 30002 'regioes1TrgDelCannot delete because foreign keys still exist in paisesRegioes'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('regioes1TrgDel') IS NOT NULL
    PRINT '<<< CREATED TRIGGER regioes1TrgDel >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER regioes1TrgDel >>>'
go


