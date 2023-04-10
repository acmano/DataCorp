/* 
 * TRIGGER: [cepLogradouroEnderecosTrgUpd] 
 */

CREATE TRIGGER [cepLogradouroEnderecosTrgUpd] ON cepLogradouroEnderecos
FOR UPDATE AS
BEGIN
    DECLARE
        @cepEndID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Child Update: RESTRICT

    IF (UPDATE(endID))
    BEGIN
        SELECT @NullRows = COUNT(*)
          FROM inserted
          WHERE  inserted.endID IS NULL

        SELECT @ValidRows = COUNT(*)
          FROM enderecos pr, inserted
          WHERE pr.endID = inserted.endID

        IF (@NullRows + @ValidRows <> @Rows)
        BEGIN
            RAISERROR 30001 'cepLogradouroEnderecosTrgUpdCannot update because primary key value not found in enderecos'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(cepLogID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM cepsLogradouros pr, inserted
          WHERE pr.cepLogID = inserted.cepLogID) != @Rows)
        BEGIN
            RAISERROR 30001 'cepLogradouroEnderecosTrgUpdCannot update because primary key value not found in cepsLogradouros'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('cepLogradouroEnderecosTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER cepLogradouroEnderecosTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER cepLogradouroEnderecosTrgUpd >>>'
go


