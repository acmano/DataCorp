/* 
 * TRIGGER: [subDistritosMunicipioTrgIns] 
 */

CREATE TRIGGER [subDistritosMunicipioTrgIns] ON subDistritosMunicipio
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
        RAISERROR 30000 'subDistritosMunicipioTrgInsCannot insert because primary key value not found in municipios'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    SELECT @NullRows = COUNT(*)
        FROM inserted
        WHERE  inserted.subDisID IS NULL

    SELECT @ValidRows = COUNT(*)
        FROM subDistritos pr, inserted
        WHERE pr.subDisID = inserted.subDisID

    IF (@NullRows + @ValidRows <> @Rows)
    BEGIN
        RAISERROR 30000 'subDistritosMunicipioTrgInsCannot insert because primary key value not found in subDistritos'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('subDistritosMunicipioTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER subDistritosMunicipioTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER subDistritosMunicipioTrgIns >>>'
go


