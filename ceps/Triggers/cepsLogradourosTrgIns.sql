/* 
 * TRIGGER: [cepsLogradourosTrgIns] 
 */

CREATE TRIGGER [cepsLogradourosTrgIns] ON cepsLogradouros
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
        WHERE  inserted.cepID IS NULL

    SELECT @ValidRows = COUNT(*)
        FROM ceps pr, inserted
        WHERE pr.cepID = inserted.cepID

    IF (@NullRows + @ValidRows <> @Rows)
    BEGIN
        RAISERROR 30000 'cepsLogradourosTrgInsCannot insert because primary key value not found in ceps'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    IF ((SELECT COUNT(*)
         FROM logradouroTipoLogradouro pr, inserted
         WHERE pr.logTipLogID = inserted.logTipLogID) != @Rows)
    BEGIN
        RAISERROR 30000 'cepsLogradourosTrgInsCannot insert because primary key value not found in logradouroTipoLogradouro'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('cepsLogradourosTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER cepsLogradourosTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER cepsLogradourosTrgIns >>>'
go


