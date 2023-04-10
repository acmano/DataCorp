/* 
 * TRIGGER: [municipiosMicroRegiaoTrgIns] 
 */

CREATE TRIGGER [municipiosMicroRegiaoTrgIns] ON municipiosMicroRegiao
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
         FROM microRegioes pr, inserted
         WHERE pr.micRegID = inserted.micRegID) != @Rows)
    BEGIN
        RAISERROR 30000 'municipiosMicroRegiaoTrgInsCannot insert because primary key value not found in microRegioes'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    SELECT @NullRows = COUNT(*)
        FROM inserted
        WHERE  inserted.munID IS NULL

    SELECT @ValidRows = COUNT(*)
        FROM municipios pr, inserted
        WHERE pr.munID = inserted.munID

    IF (@NullRows + @ValidRows <> @Rows)
    BEGIN
        RAISERROR 30000 'municipiosMicroRegiaoTrgInsCannot insert because primary key value not found in municipios'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('municipiosMicroRegiaoTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER municipiosMicroRegiaoTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER municipiosMicroRegiaoTrgIns >>>'
go


