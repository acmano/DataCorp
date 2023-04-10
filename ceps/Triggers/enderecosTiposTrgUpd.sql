/* 
 * TRIGGER: [enderecosTiposTrgUpd] 
 */

CREATE TRIGGER [enderecosTiposTrgUpd] ON enderecosTipos
FOR UPDATE AS
BEGIN
    DECLARE
        @endTipID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Update: RESTRICT

    IF (UPDATE(endTipID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM enderecosTiposEnderecos ch, deleted
          WHERE ch.endTipID = deleted.endTipID) != 0)
        BEGIN
            RAISERROR 30001 'enderecosTiposTrgUpdCannot update because foreign keys still exist in enderecosTiposEnderecos'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('enderecosTiposTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER enderecosTiposTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER enderecosTiposTrgUpd >>>'
go


