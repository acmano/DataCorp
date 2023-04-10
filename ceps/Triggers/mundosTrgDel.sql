/* 
 * TRIGGER: [mundosTrgDel] 
 */

CREATE TRIGGER [mundosTrgDel] ON mundos
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
         WHERE ch.munID = deleted.munID) != 0)
    BEGIN
        RAISERROR 30002 'mundosTrgDelCannot delete because foreign keys still exist in nacoesMundos'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM continentesMundos ch, deleted
         WHERE ch.munID = deleted.munID) != 0)
    BEGIN
        RAISERROR 30002 'mundosTrgDelCannot delete because foreign keys still exist in continentesMundos'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('mundosTrgDel') IS NOT NULL
    PRINT '<<< CREATED TRIGGER mundosTrgDel >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER mundosTrgDel >>>'
go


