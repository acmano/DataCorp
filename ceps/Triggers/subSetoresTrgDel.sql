/* 
 * TRIGGER: [subSetoresTrgDel] 
 */

CREATE TRIGGER [subSetoresTrgDel] ON subSetores
FOR DELETE AS
BEGIN
    DECLARE
        @Rows      int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM setoresSubSetores ch, deleted
         WHERE ch.subSetID = deleted.subSetID) != 0)
    BEGIN
        RAISERROR 30002 'subSetoresTrgDelCannot delete because foreign keys still exist in setoresSubSetores'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM subSetorDivisoesSubSetores ch, deleted
         WHERE ch.subSetID = deleted.subSetID) != 0)
    BEGIN
        RAISERROR 30002 'subSetoresTrgDelCannot delete because foreign keys still exist in subSetorDivisoesSubSetores'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('subSetoresTrgDel') IS NOT NULL
    PRINT '<<< CREATED TRIGGER subSetoresTrgDel >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER subSetoresTrgDel >>>'
go


