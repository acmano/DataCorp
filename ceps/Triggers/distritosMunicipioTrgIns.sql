/* 
 * TRIGGER: [distritosMunicipioTrgIns] 
 */

CREATE TRIGGER [distritosMunicipioTrgIns] ON distritosMunicipio
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
         FROM municipios pr, inserted
         WHERE pr.munID = inserted.munID) != @Rows)
    BEGIN
        RAISERROR 30000 'distritosMunicipioTrgInsCannot insert because primary key value not found in municipios'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    SELECT @NullRows = COUNT(*)
        FROM inserted
        WHERE  inserted.disID IS NULL

    SELECT @ValidRows = COUNT(*)
        FROM distritos pr, inserted
        WHERE pr.disID = inserted.disID

    IF (@NullRows + @ValidRows <> @Rows)
    BEGIN
        RAISERROR 30000 'distritosMunicipioTrgInsCannot insert because primary key value not found in distritos'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('distritosMunicipioTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER distritosMunicipioTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER distritosMunicipioTrgIns >>>'
go


