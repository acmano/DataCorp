/* 
 * TRIGGER: [continentesTrgDel] 
 */

CREATE TRIGGER [continentesTrgDel] ON continentes
FOR DELETE AS
BEGIN
    DECLARE
        @Rows      int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM nacoesContinentes ch, deleted
         WHERE ch.ctnID = deleted.ctnID) != 0)
    BEGIN
        RAISERROR 30002 'continentesTrgDelCannot delete because foreign keys still exist in nacoesContinentes'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM continentesMundos ch, deleted
         WHERE ch.ctnID = deleted.ctnID) != 0)
    BEGIN
        RAISERROR 30002 'continentesTrgDelCannot delete because foreign keys still exist in continentesMundos'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM regioesContinentes ch, deleted
         WHERE ch.ctnID = deleted.ctnID) != 0)
    BEGIN
        RAISERROR 30002 'continentesTrgDelCannot delete because foreign keys still exist in regioesContinentes'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('continentesTrgDel') IS NOT NULL
    PRINT '<<< CREATED TRIGGER continentesTrgDel >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER continentesTrgDel >>>'
go


