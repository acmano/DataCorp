/* 
 * TRIGGER: [microRegioesMesoRegiaoTrgIns] 
 */

CREATE TRIGGER [microRegioesMesoRegiaoTrgIns] ON microRegioesMesoRegiao
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
        WHERE  inserted.micRegID IS NULL

    SELECT @ValidRows = COUNT(*)
        FROM microRegioes pr, inserted
        WHERE pr.micRegID = inserted.micRegID

    IF (@NullRows + @ValidRows <> @Rows)
    BEGIN
        RAISERROR 30000 'microRegioesMesoRegiaoTrgInsCannot insert because primary key value not found in microRegioes'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    IF ((SELECT COUNT(*)
         FROM mesoRegioes pr, inserted
         WHERE pr.mesRegID = inserted.mesRegID) != @Rows)
    BEGIN
        RAISERROR 30000 'microRegioesMesoRegiaoTrgInsCannot insert because primary key value not found in mesoRegioes'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('microRegioesMesoRegiaoTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER microRegioesMesoRegiaoTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER microRegioesMesoRegiaoTrgIns >>>'
go


