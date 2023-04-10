/* 
 * TRIGGER: [enderecosTiposEnderecosTrgUpd] 
 */

CREATE TRIGGER [enderecosTiposEnderecosTrgUpd] ON enderecosTiposEnderecos
FOR UPDATE AS
BEGIN
    DECLARE
        @endTipEndID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Child Update: RESTRICT

    IF (UPDATE(endTipID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM enderecosTipos pr, inserted
          WHERE pr.endTipID = inserted.endTipID) != @Rows)
        BEGIN
            RAISERROR 30001 'enderecosTiposEnderecosTrgUpdCannot update because primary key value not found in enderecosTipos'
            ROLLBACK TRAN
        END
    END
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
            RAISERROR 30001 'enderecosTiposEnderecosTrgUpdCannot update because primary key value not found in enderecos'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('enderecosTiposEnderecosTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER enderecosTiposEnderecosTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER enderecosTiposEnderecosTrgUpd >>>'
go


