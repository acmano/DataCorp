/* 
 * TRIGGER: [cepsMunicipiosTrgUpd] 
 */

CREATE TRIGGER [cepsMunicipiosTrgUpd] ON cepsMunicipios
FOR UPDATE AS
BEGIN
    DECLARE
        @cepMunID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

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
            RAISERROR 30001 'cepsMunicipiosTrgUpdCannot update because primary key value not found in municipios'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(cepID))
    BEGIN
        SELECT @NullRows = COUNT(*)
          FROM inserted
          WHERE  inserted.cepID IS NULL

        SELECT @ValidRows = COUNT(*)
          FROM ceps pr, inserted
          WHERE pr.cepID = inserted.cepID

        IF (@NullRows + @ValidRows <> @Rows)
        BEGIN
            RAISERROR 30001 'cepsMunicipiosTrgUpdCannot update because primary key value not found in ceps'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('cepsMunicipiosTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER cepsMunicipiosTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER cepsMunicipiosTrgUpd >>>'
go


