/* 
 * TRIGGER: [regioesTrgDel] 
 */

CREATE TRIGGER [regioesTrgDel] ON regioes
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
         WHERE ch.regID = deleted.regID) != 0)
    BEGIN
        RAISERROR 30002 'regioesTrgDelCannot delete because foreign keys still exist in regioesSubRegioes'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('regioesTrgDel') IS NOT NULL
    PRINT '<<< CREATED TRIGGER regioesTrgDel >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER regioesTrgDel >>>'
go


