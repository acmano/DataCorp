/* 
 * TRIGGER: [subDistritosMunicipioTrgUpd] 
 */

CREATE TRIGGER [subDistritosMunicipioTrgUpd] ON subDistritosMunicipio
FOR UPDATE AS
BEGIN
    DECLARE
        @subDisMunID int,
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
            RAISERROR 30001 'subDistritosMunicipioTrgUpdCannot update because primary key value not found in municipios'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(subDisID))
    BEGIN
        SELECT @NullRows = COUNT(*)
          FROM inserted
          WHERE  inserted.subDisID IS NULL

        SELECT @ValidRows = COUNT(*)
          FROM subDistritos pr, inserted
          WHERE pr.subDisID = inserted.subDisID

        IF (@NullRows + @ValidRows <> @Rows)
        BEGIN
            RAISERROR 30001 'subDistritosMunicipioTrgUpdCannot update because primary key value not found in subDistritos'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('subDistritosMunicipioTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER subDistritosMunicipioTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER subDistritosMunicipioTrgUpd >>>'
go


