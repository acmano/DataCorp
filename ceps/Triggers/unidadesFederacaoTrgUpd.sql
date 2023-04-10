/* 
 * TRIGGER: [unidadesFederacaoTrgUpd] 
 */

CREATE TRIGGER [unidadesFederacaoTrgUpd] ON unidadesFederacao
FOR UPDATE AS
BEGIN
    DECLARE
        @uniFedID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Update: RESTRICT

    IF (UPDATE(uniFedID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM unidadesFederacaoRegiao ch, deleted
          WHERE ch.uniFedID = deleted.uniFedID) != 0)
        BEGIN
            RAISERROR 30001 'unidadesFederacaoTrgUpdCannot update because foreign keys still exist in unidadesFederacaoRegiao'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(uniFedID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM regioesIntermediariasUnidadeFederacao ch, deleted
          WHERE ch.uniFedID = deleted.uniFedID) != 0)
        BEGIN
            RAISERROR 30001 'unidadesFederacaoTrgUpdCannot update because foreign keys still exist in regioesIntermediariasUnidadeFederacao'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(uniFedID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM mesoRegioesUnidadeFederacao ch, deleted
          WHERE ch.uniFedID = deleted.uniFedID) != 0)
        BEGIN
            RAISERROR 30001 'unidadesFederacaoTrgUpdCannot update because foreign keys still exist in mesoRegioesUnidadeFederacao'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('unidadesFederacaoTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER unidadesFederacaoTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER unidadesFederacaoTrgUpd >>>'
go


