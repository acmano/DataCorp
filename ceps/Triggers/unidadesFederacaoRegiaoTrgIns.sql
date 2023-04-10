/* 
 * TRIGGER: [unidadesFederacaoRegiaoTrgIns] 
 */

CREATE TRIGGER [unidadesFederacaoRegiaoTrgIns] ON unidadesFederacaoRegiao
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
         FROM regiao pr, inserted
         WHERE pr.regID = inserted.regID) != @Rows)
    BEGIN
        RAISERROR 30000 'unidadesFederacaoRegiaoTrgInsCannot insert because primary key value not found in regiao'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    SELECT @NullRows = COUNT(*)
        FROM inserted
        WHERE  inserted.uniFedID IS NULL

    SELECT @ValidRows = COUNT(*)
        FROM unidadesFederacao pr, inserted
        WHERE pr.uniFedID = inserted.uniFedID

    IF (@NullRows + @ValidRows <> @Rows)
    BEGIN
        RAISERROR 30000 'unidadesFederacaoRegiaoTrgInsCannot insert because primary key value not found in unidadesFederacao'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('unidadesFederacaoRegiaoTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER unidadesFederacaoRegiaoTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER unidadesFederacaoRegiaoTrgIns >>>'
go


