/* 
 * TRIGGER: [enderecosTrgDel] 
 */

CREATE TRIGGER [enderecosTrgDel] ON enderecos
FOR DELETE AS
BEGIN
    DECLARE
        @Rows      int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM cepLogradouroEnderecos ch, deleted
         WHERE ch.endID = deleted.endID) != 0)
    BEGIN
        RAISERROR 30002 'enderecosTrgDelCannot delete because foreign keys still exist in cepLogradouroEnderecos'
        ROLLBACK TRAN
    END
-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM enderecosTiposEnderecos ch, deleted
         WHERE ch.endID = deleted.endID) != 0)
    BEGIN
        RAISERROR 30002 'enderecosTrgDelCannot delete because foreign keys still exist in enderecosTiposEnderecos'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('enderecosTrgDel') IS NOT NULL
    PRINT '<<< CREATED TRIGGER enderecosTrgDel >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER enderecosTrgDel >>>'
go


