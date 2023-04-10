/* 
 * TRIGGER: [cepsLogradourosTrgUpd] 
 */

CREATE TRIGGER [cepsLogradourosTrgUpd] ON cepsLogradouros
FOR UPDATE AS
BEGIN
    DECLARE
        @cepLogID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Update: RESTRICT

    IF (UPDATE(cepLogID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM cepLogradouroEnderecos ch, deleted
          WHERE ch.cepLogID = deleted.cepLogID) != 0)
        BEGIN
            RAISERROR 30001 'cepsLogradourosTrgUpdCannot update because foreign keys still exist in cepLogradouroEnderecos'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(cepID))
    BEGIN
        SELECT @NullRows = COUNT(*)
          FROM inserted
          WHERE  inserted.cepID IS NULL

        SELECT @ValidRows = COUNT(*)
          FROM ceps pr, inserted
          WHERE pr.cepID = inserted.cepID

        IF (@NullRows + @ValidRows <> @Rows)
        BEGIN
            RAISERROR 30001 'cepsLogradourosTrgUpdCannot update because primary key value not found in ceps'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(logTipLogID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM logradouroTipoLogradouro pr, inserted
          WHERE pr.logTipLogID = inserted.logTipLogID) != @Rows)
        BEGIN
            RAISERROR 30001 'cepsLogradourosTrgUpdCannot update because primary key value not found in logradouroTipoLogradouro'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('cepsLogradourosTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER cepsLogradourosTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER cepsLogradourosTrgUpd >>>'
go


