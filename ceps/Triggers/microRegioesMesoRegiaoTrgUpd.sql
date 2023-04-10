/* 
 * TRIGGER: [microRegioesMesoRegiaoTrgUpd] 
 */

CREATE TRIGGER [microRegioesMesoRegiaoTrgUpd] ON microRegioesMesoRegiao
FOR UPDATE AS
BEGIN
    DECLARE
        @micRegMesRegID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Child Update: RESTRICT

    IF (UPDATE(micRegID))
    BEGIN
        SELECT @NullRows = COUNT(*)
          FROM inserted
          WHERE  inserted.micRegID IS NULL

        SELECT @ValidRows = COUNT(*)
          FROM microRegioes pr, inserted
          WHERE pr.micRegID = inserted.micRegID

        IF (@NullRows + @ValidRows <> @Rows)
        BEGIN
            RAISERROR 30001 'microRegioesMesoRegiaoTrgUpdCannot update because primary key value not found in microRegioes'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(mesRegID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM mesoRegioes pr, inserted
          WHERE pr.mesRegID = inserted.mesRegID) != @Rows)
        BEGIN
            RAISERROR 30001 'microRegioesMesoRegiaoTrgUpdCannot update because primary key value not found in mesoRegioes'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('microRegioesMesoRegiaoTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER microRegioesMesoRegiaoTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER microRegioesMesoRegiaoTrgUpd >>>'
go


