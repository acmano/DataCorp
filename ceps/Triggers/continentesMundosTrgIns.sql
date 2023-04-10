/* 
 * TRIGGER: [continentesMundosTrgIns] 
 */

CREATE TRIGGER [continentesMundosTrgIns] ON continentesMundos
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
         FROM mundos pr, inserted
         WHERE pr.munID = inserted.munID) != @Rows)
    BEGIN
        RAISERROR 30000 'continentesMundosTrgInsCannot insert because primary key value not found in mundos'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    IF ((SELECT COUNT(*)
         FROM continentes pr, inserted
         WHERE pr.ctnID = inserted.ctnID) != @Rows)
    BEGIN
        RAISERROR 30000 'continentesMundosTrgInsCannot insert because primary key value not found in continentes'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('continentesMundosTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER continentesMundosTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER continentesMundosTrgIns >>>'
go


