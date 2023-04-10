/* 
 * TRIGGER: [sufixosTrgDel] 
 */

CREATE TRIGGER [sufixosTrgDel] ON sufixos
FOR DELETE AS
BEGIN
    DECLARE
        @Rows      int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM sufixosTiposSufixos ch, deleted
         WHERE ch.sufID = deleted.sufID) != 0)
    BEGIN
        RAISERROR 30002 'sufixosTrgDelCannot delete because foreign keys still exist in sufixosTiposSufixos'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM ceps ch, deleted
         WHERE ch.sufID = deleted.sufID) != 0)
    BEGIN
        RAISERROR 30002 'sufixosTrgDelCannot delete because foreign keys still exist in ceps'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('sufixosTrgDel') IS NOT NULL
    PRINT '<<< CREATED TRIGGER sufixosTrgDel >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER sufixosTrgDel >>>'
go


