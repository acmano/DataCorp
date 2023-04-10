/* 
 * TRIGGER: [unidadesFederacaoRegiaoTrgUpd] 
 */

CREATE TRIGGER [unidadesFederacaoRegiaoTrgUpd] ON unidadesFederacaoRegiao
FOR UPDATE AS
BEGIN
    DECLARE
        @uniFedRegID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Child Update: RESTRICT

    IF (UPDATE(regID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM regiao pr, inserted
          WHERE pr.regID = inserted.regID) != @Rows)
        BEGIN
            RAISERROR 30001 'unidadesFederacaoRegiaoTrgUpdCannot update because primary key value not found in regiao'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(uniFedID))
    BEGIN
        SELECT @NullRows = COUNT(*)
          FROM inserted
          WHERE  inserted.uniFedID IS NULL

        SELECT @ValidRows = COUNT(*)
          FROM unidadesFederacao pr, inserted
          WHERE pr.uniFedID = inserted.uniFedID

        IF (@NullRows + @ValidRows <> @Rows)
        BEGIN
            RAISERROR 30001 'unidadesFederacaoRegiaoTrgUpdCannot update because primary key value not found in unidadesFederacao'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('unidadesFederacaoRegiaoTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER unidadesFederacaoRegiaoTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER unidadesFederacaoRegiaoTrgUpd >>>'
go


