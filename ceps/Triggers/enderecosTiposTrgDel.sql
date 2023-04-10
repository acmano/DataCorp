/* 
 * TRIGGER: [enderecosTiposTrgDel] 
 */

CREATE TRIGGER [enderecosTiposTrgDel] ON enderecosTipos
FOR DELETE AS
BEGIN
    DECLARE
        @Rows      int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM enderecosTiposEnderecos ch, deleted
         WHERE ch.endTipID = deleted.endTipID) != 0)
    BEGIN
        RAISERROR 30002 'enderecosTiposTrgDelCannot delete because foreign keys still exist in enderecosTiposEnderecos'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('enderecosTiposTrgDel') IS NOT NULL
    PRINT '<<< CREATED TRIGGER enderecosTiposTrgDel >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER enderecosTiposTrgDel >>>'
go


