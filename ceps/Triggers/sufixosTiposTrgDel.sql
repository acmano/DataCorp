/* 
 * TRIGGER: [sufixosTiposTrgDel] 
 */

CREATE TRIGGER [sufixosTiposTrgDel] ON sufixosTipos
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
         WHERE ch.sufTipID = deleted.sufTipID) != 0)
    BEGIN
        RAISERROR 30002 'sufixosTiposTrgDelCannot delete because foreign keys still exist in sufixosTiposSufixos'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('sufixosTiposTrgDel') IS NOT NULL
    PRINT '<<< CREATED TRIGGER sufixosTiposTrgDel >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER sufixosTiposTrgDel >>>'
go


