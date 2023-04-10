/* 
 * TRIGGER: [cepsLogradourosTrgDel] 
 */

CREATE TRIGGER [cepsLogradourosTrgDel] ON cepsLogradouros
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
         WHERE ch.cepLogID = deleted.cepLogID) != 0)
    BEGIN
        RAISERROR 30002 'cepsLogradourosTrgDelCannot delete because foreign keys still exist in cepLogradouroEnderecos'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('cepsLogradourosTrgDel') IS NOT NULL
    PRINT '<<< CREATED TRIGGER cepsLogradourosTrgDel >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER cepsLogradourosTrgDel >>>'
go


