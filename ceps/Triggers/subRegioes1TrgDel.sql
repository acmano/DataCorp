/* 
 * TRIGGER: [subRegioes1TrgDel] 
 */

CREATE TRIGGER [subRegioes1TrgDel] ON subRegioes
FOR DELETE AS
BEGIN
    DECLARE
        @Rows      int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM paisesSubRegioes ch, deleted
         WHERE ch.subRegID = deleted.subRegID) != 0)
    BEGIN
        RAISERROR 30002 'subRegioes1TrgDelCannot delete because foreign keys still exist in paisesSubRegioes'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM nacoesSubRegioes ch, deleted
         WHERE ch.subRegID = deleted.subRegID) != 0)
    BEGIN
        RAISERROR 30002 'subRegioes1TrgDelCannot delete because foreign keys still exist in nacoesSubRegioes'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM subRegioesRegioes ch, deleted
         WHERE ch.subRegID = deleted.subRegID) != 0)
    BEGIN
        RAISERROR 30002 'subRegioes1TrgDelCannot delete because foreign keys still exist in subRegioesRegioes'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('subRegioes1TrgDel') IS NOT NULL
    PRINT '<<< CREATED TRIGGER subRegioes1TrgDel >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER subRegioes1TrgDel >>>'
go


