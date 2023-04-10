/* 
 * TRIGGER: [enderecosTiposEnderecosTrgIns] 
 */

CREATE TRIGGER [enderecosTiposEnderecosTrgIns] ON enderecosTiposEnderecos
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
         FROM enderecosTipos pr, inserted
         WHERE pr.endTipID = inserted.endTipID) != @Rows)
    BEGIN
        RAISERROR 30000 'enderecosTiposEnderecosTrgInsCannot insert because primary key value not found in enderecosTipos'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    SELECT @NullRows = COUNT(*)
        FROM inserted
        WHERE  inserted.endID IS NULL

    SELECT @ValidRows = COUNT(*)
        FROM enderecos pr, inserted
        WHERE pr.endID = inserted.endID

    IF (@NullRows + @ValidRows <> @Rows)
    BEGIN
        RAISERROR 30000 'enderecosTiposEnderecosTrgInsCannot insert because primary key value not found in enderecos'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('enderecosTiposEnderecosTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER enderecosTiposEnderecosTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER enderecosTiposEnderecosTrgIns >>>'
go


