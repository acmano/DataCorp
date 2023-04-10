/* 
 * TRIGGER: [logradouroTipoTrgDel] 
 */

CREATE TRIGGER [logradouroTipoTrgDel] ON logradouroTipo
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
         WHERE ch.logTipID = deleted.logTipID) != 0)
    BEGIN
        RAISERROR 30002 'logradouroTipoTrgDelCannot delete because foreign keys still exist in logradouroTipoLogradouro'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('logradouroTipoTrgDel') IS NOT NULL
    PRINT '<<< CREATED TRIGGER logradouroTipoTrgDel >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER logradouroTipoTrgDel >>>'
go


