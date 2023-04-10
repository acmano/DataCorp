/* 
 * TRIGGER: [mesoRegioesUnidadeFederacaoTrgIns] 
 */

CREATE TRIGGER [mesoRegioesUnidadeFederacaoTrgIns] ON mesoRegioesUnidadeFederacao
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
         FROM unidadesFederacao pr, inserted
         WHERE pr.uniFedID = inserted.uniFedID) != @Rows)
    BEGIN
        RAISERROR 30000 'mesoRegioesUnidadeFederacaoTrgInsCannot insert because primary key value not found in unidadesFederacao'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    SELECT @NullRows = COUNT(*)
        FROM inserted
        WHERE  inserted.mesRegID IS NULL

    SELECT @ValidRows = COUNT(*)
        FROM mesoRegioes pr, inserted
        WHERE pr.mesRegID = inserted.mesRegID

    IF (@NullRows + @ValidRows <> @Rows)
    BEGIN
        RAISERROR 30000 'mesoRegioesUnidadeFederacaoTrgInsCannot insert because primary key value not found in mesoRegioes'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('mesoRegioesUnidadeFederacaoTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER mesoRegioesUnidadeFederacaoTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER mesoRegioesUnidadeFederacaoTrgIns >>>'
go


