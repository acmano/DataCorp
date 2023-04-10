/* 
 * TRIGGER: [logradouroTipoTrgUpd] 
 */

CREATE TRIGGER [logradouroTipoTrgUpd] ON logradouroTipo
FOR UPDATE AS
BEGIN
    DECLARE
        @logTipID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Update: RESTRICT

    IF (UPDATE(logTipID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM logradouroTipoLogradouro ch, deleted
          WHERE ch.logTipID = deleted.logTipID) != 0)
        BEGIN
            RAISERROR 30001 'logradouroTipoTrgUpdCannot update because foreign keys still exist in logradouroTipoLogradouro'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('logradouroTipoTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER logradouroTipoTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER logradouroTipoTrgUpd >>>'
go


