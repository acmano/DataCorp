/* 
 * TRIGGER: [regioesImediatasTrgDel] 
 */

CREATE TRIGGER [regioesImediatasTrgDel] ON regioesImediatas
FOR DELETE AS
BEGIN
    DECLARE
        @Rows      int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM municipiosRegiaoImediata ch, deleted
         WHERE ch.regImeID = deleted.regImeID) != 0)
    BEGIN
        RAISERROR 30002 'regioesImediatasTrgDelCannot delete because foreign keys still exist in municipiosRegiaoImediata'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM regioesImediatasRegiaoIntermediaria ch, deleted
         WHERE ch.regImeID = deleted.regImeID) != 0)
    BEGIN
        RAISERROR 30002 'regioesImediatasTrgDelCannot delete because foreign keys still exist in regioesImediatasRegiaoIntermediaria'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('regioesImediatasTrgDel') IS NOT NULL
    PRINT '<<< CREATED TRIGGER regioesImediatasTrgDel >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER regioesImediatasTrgDel >>>'
go


