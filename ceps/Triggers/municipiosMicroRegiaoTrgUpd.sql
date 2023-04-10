/* 
 * TRIGGER: [municipiosMicroRegiaoTrgUpd] 
 */

CREATE TRIGGER [municipiosMicroRegiaoTrgUpd] ON municipiosMicroRegiao
FOR UPDATE AS
BEGIN
    DECLARE
        @munMicRegID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Child Update: RESTRICT

    IF (UPDATE(micRegID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM microRegioes pr, inserted
          WHERE pr.micRegID = inserted.micRegID) != @Rows)
        BEGIN
            RAISERROR 30001 'municipiosMicroRegiaoTrgUpdCannot update because primary key value not found in microRegioes'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(munID))
    BEGIN
        SELECT @NullRows = COUNT(*)
          FROM inserted
          WHERE  inserted.munID IS NULL

        SELECT @ValidRows = COUNT(*)
          FROM municipios pr, inserted
          WHERE pr.munID = inserted.munID

        IF (@NullRows + @ValidRows <> @Rows)
        BEGIN
            RAISERROR 30001 'municipiosMicroRegiaoTrgUpdCannot update because primary key value not found in municipios'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('municipiosMicroRegiaoTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER municipiosMicroRegiaoTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER municipiosMicroRegiaoTrgUpd >>>'
go


