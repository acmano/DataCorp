/* 
 * TRIGGER: [logradouroTipoLogradouroTrgIns] 
 */

CREATE TRIGGER [logradouroTipoLogradouroTrgIns] ON logradouroTipoLogradouro
FOR INSERT AS
BEGIN
    DECLARE
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Child Insert: RESTRICT

    IF ((SELECT COUNT(*)
         FROM logradouroTipo pr, inserted
         WHERE pr.logTipID = inserted.logTipID) != @Rows)
    BEGIN
        RAISERROR 30000 'logradouroTipoLogradouroTrgInsCannot insert because primary key value not found in logradouroTipo'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    IF ((SELECT COUNT(*)
         FROM logradouros pr, inserted
         WHERE pr.logID = inserted.logID) != @Rows)
    BEGIN
        RAISERROR 30000 'logradouroTipoLogradouroTrgInsCannot insert because primary key value not found in logradouros'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('logradouroTipoLogradouroTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER logradouroTipoLogradouroTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER logradouroTipoLogradouroTrgIns >>>'
go


