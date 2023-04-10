/* 
 * TRIGGER: [cepLogradouroEnderecosTrgIns] 
 */

CREATE TRIGGER [cepLogradouroEnderecosTrgIns] ON cepLogradouroEnderecos
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

    SELECT @NullRows = COUNT(*)
        FROM inserted
        WHERE  inserted.endID IS NULL

    SELECT @ValidRows = COUNT(*)
        FROM enderecos pr, inserted
        WHERE pr.endID = inserted.endID

    IF (@NullRows + @ValidRows <> @Rows)
    BEGIN
        RAISERROR 30000 'cepLogradouroEnderecosTrgInsCannot insert because primary key value not found in enderecos'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    IF ((SELECT COUNT(*)
         FROM cepsLogradouros pr, inserted
         WHERE pr.cepLogID = inserted.cepLogID) != @Rows)
    BEGIN
        RAISERROR 30000 'cepLogradouroEnderecosTrgInsCannot insert because primary key value not found in cepsLogradouros'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('cepLogradouroEnderecosTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER cepLogradouroEnderecosTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER cepLogradouroEnderecosTrgIns >>>'
go


