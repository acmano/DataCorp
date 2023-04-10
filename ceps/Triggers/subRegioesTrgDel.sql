/* 
 * TRIGGER: [subRegioesTrgDel] 
 */

CREATE TRIGGER [subRegioesTrgDel] ON subRegioes
FOR DELETE AS
BEGIN
    DECLARE
        @Rows      int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM regioesSubRegioes ch, deleted
         WHERE ch.subRegID = deleted.subRegID) != 0)
    BEGIN
        RAISERROR 30002 'subRegioesTrgDelCannot delete because foreign keys still exist in regioesSubRegioes'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM setoresSubRegioes ch, deleted
         WHERE ch.subRegID = deleted.subRegID) != 0)
    BEGIN
        RAISERROR 30002 'subRegioesTrgDelCannot delete because foreign keys still exist in setoresSubRegioes'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('subRegioesTrgDel') IS NOT NULL
    PRINT '<<< CREATED TRIGGER subRegioesTrgDel >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER subRegioesTrgDel >>>'
go


