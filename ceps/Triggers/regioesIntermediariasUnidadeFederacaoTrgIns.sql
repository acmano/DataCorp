/* 
 * TRIGGER: [regioesIntermediariasUnidadeFederacaoTrgIns] 
 */

CREATE TRIGGER [regioesIntermediariasUnidadeFederacaoTrgIns] ON regioesIntermediariasUnidadeFederacao
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
        RAISERROR 30000 'regioesIntermediariasUnidadeFederacaoTrgInsCannot insert because primary key value not found in unidadesFederacao'
        ROLLBACK TRAN
    END
-- Child Insert: RESTRICT

    SELECT @NullRows = COUNT(*)
        FROM inserted
        WHERE  inserted.regIntID IS NULL

    SELECT @ValidRows = COUNT(*)
        FROM regioesIntermediarias pr, inserted
        WHERE pr.regIntID = inserted.regIntID

    IF (@NullRows + @ValidRows <> @Rows)
    BEGIN
        RAISERROR 30000 'regioesIntermediariasUnidadeFederacaoTrgInsCannot insert because primary key value not found in regioesIntermediarias'
        ROLLBACK TRAN
    END

END



go
IF OBJECT_ID('regioesIntermediariasUnidadeFederacaoTrgIns') IS NOT NULL
    PRINT '<<< CREATED TRIGGER regioesIntermediariasUnidadeFederacaoTrgIns >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER regioesIntermediariasUnidadeFederacaoTrgIns >>>'
go


