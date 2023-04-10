/* 
 * TRIGGER: [continentesMundosTrgUpd] 
 */

CREATE TRIGGER [continentesMundosTrgUpd] ON continentesMundos
FOR UPDATE AS
BEGIN
    DECLARE
        @ctnMunID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Child Update: RESTRICT

    IF (UPDATE(munID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM mundos pr, inserted
          WHERE pr.munID = inserted.munID) != @Rows)
        BEGIN
            RAISERROR 30001 'continentesMundosTrgUpdCannot update because primary key value not found in mundos'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(ctnID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM continentes pr, inserted
          WHERE pr.ctnID = inserted.ctnID) != @Rows)
        BEGIN
            RAISERROR 30001 'continentesMundosTrgUpdCannot update because primary key value not found in continentes'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('continentesMundosTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER continentesMundosTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER continentesMundosTrgUpd >>>'
go


