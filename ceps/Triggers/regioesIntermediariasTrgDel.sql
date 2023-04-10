/* 
 * TRIGGER: [regioesIntermediariasTrgDel] 
 */

CREATE TRIGGER [regioesIntermediariasTrgDel] ON regioesIntermediarias
FOR DELETE AS
BEGIN
    DECLARE
        @Rows      int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM regioesIntermediariasUnidadeFederacao ch, deleted
         WHERE ch.regIntID = deleted.regIntID) != 0)
    BEGIN
        RAISERROR 30002 'regioesIntermediariasTrgDelCannot delete because foreign keys still exist in regioesIntermediariasUnidadeFederacao'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM regioesImediatasRegiaoIntermediaria ch, deleted
         WHERE ch.regIntID = deleted.regIntID) != 0)
    BEGIN
        RAISERROR 30002 'regioesIntermediariasTrgDelCannot delete because foreign keys still exist in regioesImediatasRegiaoIntermediaria'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('regioesIntermediariasTrgDel') IS NOT NULL
    PRINT '<<< CREATED TRIGGER regioesIntermediariasTrgDel >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER regioesIntermediariasTrgDel >>>'
go


