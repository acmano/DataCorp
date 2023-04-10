/* 
 * TRIGGER: [regioesIntermediariasUnidadeFederacaoTrgUpd] 
 */

CREATE TRIGGER [regioesIntermediariasUnidadeFederacaoTrgUpd] ON regioesIntermediariasUnidadeFederacao
FOR UPDATE AS
BEGIN
    DECLARE
        @regIntUniFedID int,
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
            RAISERROR 30001 'regioesIntermediariasUnidadeFederacaoTrgUpdCannot update because primary key value not found in unidadesFederacao'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(regIntID))
    BEGIN
        SELECT @NullRows = COUNT(*)
          FROM inserted
          WHERE  inserted.regIntID IS NULL

        SELECT @ValidRows = COUNT(*)
          FROM regioesIntermediarias pr, inserted
          WHERE pr.regIntID = inserted.regIntID

        IF (@NullRows + @ValidRows <> @Rows)
        BEGIN
            RAISERROR 30001 'regioesIntermediariasUnidadeFederacaoTrgUpdCannot update because primary key value not found in regioesIntermediarias'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('regioesIntermediariasUnidadeFederacaoTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER regioesIntermediariasUnidadeFederacaoTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER regioesIntermediariasUnidadeFederacaoTrgUpd >>>'
go


