/* 
 * TRIGGER: [logradouroTipoLogradouroTrgDel] 
 */

CREATE TRIGGER [logradouroTipoLogradouroTrgDel] ON logradouroTipoLogradouro
FOR DELETE AS
BEGIN
    DECLARE
        @Rows      int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Delete: RESTRICT

    IF ((SELECT COUNT(*)
         FROM cepsLogradouros ch, deleted
         WHERE ch.logTipLogID = deleted.logTipLogID) != 0)
    BEGIN
        RAISERROR 30002 'logradouroTipoLogradouroTrgDelCannot delete because foreign keys still exist in cepsLogradouros'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('logradouroTipoLogradouroTrgDel') IS NOT NULL
    PRINT '<<< CREATED TRIGGER logradouroTipoLogradouroTrgDel >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER logradouroTipoLogradouroTrgDel >>>'
go


