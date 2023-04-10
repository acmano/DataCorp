/* 
 * TRIGGER: [logradouroTipoLogradouroTrgUpd] 
 */

CREATE TRIGGER [logradouroTipoLogradouroTrgUpd] ON logradouroTipoLogradouro
FOR UPDATE AS
BEGIN
    DECLARE
        @logTipLogID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Update: RESTRICT

    IF (UPDATE(logTipLogID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM cepsLogradouros ch, deleted
          WHERE ch.logTipLogID = deleted.logTipLogID) != 0)
        BEGIN
            RAISERROR 30001 'logradouroTipoLogradouroTrgUpdCannot update because foreign keys still exist in cepsLogradouros'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(logTipID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM logradouroTipo pr, inserted
          WHERE pr.logTipID = inserted.logTipID) != @Rows)
        BEGIN
            RAISERROR 30001 'logradouroTipoLogradouroTrgUpdCannot update because primary key value not found in logradouroTipo'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(logID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM logradouros pr, inserted
          WHERE pr.logID = inserted.logID) != @Rows)
        BEGIN
            RAISERROR 30001 'logradouroTipoLogradouroTrgUpdCannot update because primary key value not found in logradouros'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('logradouroTipoLogradouroTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER logradouroTipoLogradouroTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER logradouroTipoLogradouroTrgUpd >>>'
go


