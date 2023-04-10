/* 
 * TRIGGER: [subSetorDivisoesTrgDel] 
 */

CREATE TRIGGER [subSetorDivisoesTrgDel] ON subSetorDivisoes
FOR DELETE AS
BEGIN
    DECLARE
        @Rows      int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM subSetorDivisoesSubSetores ch, deleted
         WHERE ch.subSetDivID = deleted.subSetDivID) != 0)
    BEGIN
        RAISERROR 30002 'subSetorDivisoesTrgDelCannot delete because foreign keys still exist in subSetorDivisoesSubSetores'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM ceps ch, deleted
         WHERE ch.subSetDivID = deleted.subSetDivID) != 0)
    BEGIN
        RAISERROR 30002 'subSetorDivisoesTrgDelCannot delete because foreign keys still exist in ceps'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('subSetorDivisoesTrgDel') IS NOT NULL
    PRINT '<<< CREATED TRIGGER subSetorDivisoesTrgDel >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER subSetorDivisoesTrgDel >>>'
go


