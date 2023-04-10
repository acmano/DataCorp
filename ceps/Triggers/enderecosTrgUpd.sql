/* 
 * TRIGGER: [enderecosTrgUpd] 
 */

CREATE TRIGGER [enderecosTrgUpd] ON enderecos
FOR UPDATE AS
BEGIN
    DECLARE
        @endID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Update: RESTRICT

    IF (UPDATE(endID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM cepLogradouroEnderecos ch, deleted
          WHERE ch.endID = deleted.endID) != 0)
        BEGIN
            RAISERROR 30001 'enderecosTrgUpdCannot update because foreign keys still exist in cepLogradouroEnderecos'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(endID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM enderecosTiposEnderecos ch, deleted
          WHERE ch.endID = deleted.endID) != 0)
        BEGIN
            RAISERROR 30001 'enderecosTrgUpdCannot update because foreign keys still exist in enderecosTiposEnderecos'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('enderecosTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER enderecosTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER enderecosTrgUpd >>>'
go


