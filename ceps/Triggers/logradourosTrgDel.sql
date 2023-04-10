/* 
 * TRIGGER: [logradourosTrgDel] 
 */

CREATE TRIGGER [logradourosTrgDel] ON logradouros
FOR DELETE AS
BEGIN
    DECLARE
        @Rows      int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM logradouroTipoLogradouro ch, deleted
         WHERE ch.logID = deleted.logID) != 0)
    BEGIN
        RAISERROR 30002 'logradourosTrgDelCannot delete because foreign keys still exist in logradouroTipoLogradouro'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('logradourosTrgDel') IS NOT NULL
    PRINT '<<< CREATED TRIGGER logradourosTrgDel >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER logradourosTrgDel >>>'
go


