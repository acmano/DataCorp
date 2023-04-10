/* 
 * TRIGGER: [logradourosTrgUpd] 
 */

CREATE TRIGGER [logradourosTrgUpd] ON logradouros
FOR UPDATE AS
BEGIN
    DECLARE
        @logID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Update: RESTRICT

    IF (UPDATE(logID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM logradouroTipoLogradouro ch, deleted
          WHERE ch.logID = deleted.logID) != 0)
        BEGIN
            RAISERROR 30001 'logradourosTrgUpdCannot update because foreign keys still exist in logradouroTipoLogradouro'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('logradourosTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER logradourosTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER logradourosTrgUpd >>>'
go


