/* 
 * TRIGGER: [cepsMunicipiosTrgIns] 
 */

CREATE TRIGGER [cepsMunicipiosTrgIns] ON cepsMunicipios
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
        WHERE  inserted.munID IS NULL

    SELECT @ValidRows = COUNT(*)
        FROM municipios pr, inserted
        WHERE pr.munID = inserted.munID

    IF (@NullRows + @ValidRows <> @Rows)
    BEGIN
        RAISERROR 30000 'cepsMunicipiosTrgInsCannot insert because primary key value not found in municipios'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    SELECT @NullRows = COUNT(*)
        FROM inserted
        WHERE  inserted.cepID IS NULL

    SELECT @ValidRows = COUNT(*)
        FROM ceps pr, inserted
        WHERE pr.cepID = inserted.cepID

    IF (@NullRows + @ValidRows <> @Rows)
    BEGIN
        RAISERROR 30000 'cepsMunicipiosTrgInsCannot insert because primary key value not found in ceps'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('cepsMunicipiosTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER cepsMunicipiosTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER cepsMunicipiosTrgIns >>>'
go


