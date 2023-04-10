/* 
 * TRIGGER: [mesoRegioesUnidadeFederacaoTrgUpd] 
 */

CREATE TRIGGER [mesoRegioesUnidadeFederacaoTrgUpd] ON mesoRegioesUnidadeFederacao
FOR UPDATE AS
BEGIN
    DECLARE
        @mesRegUniFedID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Child Update: RESTRICT

    IF (UPDATE(uniFedID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM unidadesFederacao pr, inserted
          WHERE pr.uniFedID = inserted.uniFedID) != @Rows)
        BEGIN
            RAISERROR 30001 'mesoRegioesUnidadeFederacaoTrgUpdCannot update because primary key value not found in unidadesFederacao'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(mesRegID))
    BEGIN
        SELECT @NullRows = COUNT(*)
          FROM inserted
          WHERE  inserted.mesRegID IS NULL

        SELECT @ValidRows = COUNT(*)
          FROM mesoRegioes pr, inserted
          WHERE pr.mesRegID = inserted.mesRegID

        IF (@NullRows + @ValidRows <> @Rows)
        BEGIN
            RAISERROR 30001 'mesoRegioesUnidadeFederacaoTrgUpdCannot update because primary key value not found in mesoRegioes'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('mesoRegioesUnidadeFederacaoTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER mesoRegioesUnidadeFederacaoTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER mesoRegioesUnidadeFederacaoTrgUpd >>>'
go


