/* 
 * TRIGGER: [regiaoTrgUpd] 
 */

CREATE TRIGGER [regiaoTrgUpd] ON regiao
FOR UPDATE AS
BEGIN
    DECLARE
        @regID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Update: RESTRICT

    IF (UPDATE(regID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM unidadesFederacaoRegiao ch, deleted
          WHERE ch.regID = deleted.regID) != 0)
        BEGIN
            RAISERROR 30001 'regiaoTrgUpdCannot update because foreign keys still exist in unidadesFederacaoRegiao'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(regID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM regioesNacoes ch, deleted
          WHERE ch.regID = deleted.regID) != 0)
        BEGIN
            RAISERROR 30001 'regiaoTrgUpdCannot update because foreign keys still exist in regioesNacoes'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('regiaoTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER regiaoTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER regiaoTrgUpd >>>'
go


