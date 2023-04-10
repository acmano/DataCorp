/* 
 * TRIGGER: [paisesTrgDel] 
 */

CREATE TRIGGER [paisesTrgDel] ON paises
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
         WHERE ch.paiID = deleted.paiID) != 0)
    BEGIN
        RAISERROR 30002 'paisesTrgDelCannot delete because foreign keys still exist in paisesSubRegioes'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM nacoesPaises ch, deleted
         WHERE ch.paiID = deleted.paiID) != 0)
    BEGIN
        RAISERROR 30002 'paisesTrgDelCannot delete because foreign keys still exist in nacoesPaises'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM paisesRegioes ch, deleted
         WHERE ch.paiID = deleted.paiID) != 0)
    BEGIN
        RAISERROR 30002 'paisesTrgDelCannot delete because foreign keys still exist in paisesRegioes'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('paisesTrgDel') IS NOT NULL
    PRINT '<<< CREATED TRIGGER paisesTrgDel >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER paisesTrgDel >>>'
go


