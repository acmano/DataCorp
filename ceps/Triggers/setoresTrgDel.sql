/* 
 * TRIGGER: [setoresTrgDel] 
 */

CREATE TRIGGER [setoresTrgDel] ON setores
FOR DELETE AS
BEGIN
    DECLARE
        @Rows      int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM setoresSubRegioes ch, deleted
         WHERE ch.setID = deleted.setID) != 0)
    BEGIN
        RAISERROR 30002 'setoresTrgDelCannot delete because foreign keys still exist in setoresSubRegioes'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM setoresSubSetores ch, deleted
         WHERE ch.setID = deleted.setID) != 0)
    BEGIN
        RAISERROR 30002 'setoresTrgDelCannot delete because foreign keys still exist in setoresSubSetores'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('setoresTrgDel') IS NOT NULL
    PRINT '<<< CREATED TRIGGER setoresTrgDel >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER setoresTrgDel >>>'
go


