/* 
 * TRIGGER: [distritosMunicipioTrgUpd] 
 */

CREATE TRIGGER [distritosMunicipioTrgUpd] ON distritosMunicipio
FOR UPDATE AS
BEGIN
    DECLARE
        @disMunID int,
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
          FROM municipios pr, inserted
          WHERE pr.munID = inserted.munID) != @Rows)
        BEGIN
            RAISERROR 30001 'distritosMunicipioTrgUpdCannot update because primary key value not found in municipios'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(disID))
    BEGIN
        SELECT @NullRows = COUNT(*)
          FROM inserted
          WHERE  inserted.disID IS NULL

        SELECT @ValidRows = COUNT(*)
          FROM distritos pr, inserted
          WHERE pr.disID = inserted.disID

        IF (@NullRows + @ValidRows <> @Rows)
        BEGIN
            RAISERROR 30001 'distritosMunicipioTrgUpdCannot update because primary key value not found in distritos'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('distritosMunicipioTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER distritosMunicipioTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER distritosMunicipioTrgUpd >>>'
go


