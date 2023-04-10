/* 
 * TRIGGER: [cepsTrgUpd] 
 */

CREATE TRIGGER [cepsTrgUpd] ON ceps
FOR UPDATE AS
BEGIN
    DECLARE
        @cepID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Parent Update: RESTRICT

    IF (UPDATE(cepID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM cepsLogradouros ch, deleted
          WHERE ch.cepID = deleted.cepID) != 0)
        BEGIN
            RAISERROR 30001 'cepsTrgUpdCannot update because foreign keys still exist in cepsLogradouros'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(cepID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM cepsDistritos ch, deleted
          WHERE ch.cepID = deleted.cepID) != 0)
        BEGIN
            RAISERROR 30001 'cepsTrgUpdCannot update because foreign keys still exist in cepsDistritos'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(cepID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM cepsSubDistritos ch, deleted
          WHERE ch.cepID = deleted.cepID) != 0)
        BEGIN
            RAISERROR 30001 'cepsTrgUpdCannot update because foreign keys still exist in cepsSubDistritos'
            ROLLBACK TRAN
        END
    END
-- Parent Update: RESTRICT

    IF (UPDATE(cepID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM cepsMunicipios ch, deleted
          WHERE ch.cepID = deleted.cepID) != 0)
        BEGIN
            RAISERROR 30001 'cepsTrgUpdCannot update because foreign keys still exist in cepsMunicipios'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(subSetDivID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM subSetorDivisoes pr, inserted
          WHERE pr.subSetDivID = inserted.subSetDivID) != @Rows)
        BEGIN
            RAISERROR 30001 'cepsTrgUpdCannot update because primary key value not found in subSetorDivisoes'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(sufID))
    BEGIN
        SELECT @NullRows = COUNT(*)
          FROM inserted
          WHERE  inserted.sufID IS NULL

        SELECT @ValidRows = COUNT(*)
          FROM sufixos pr, inserted
          WHERE pr.sufID = inserted.sufID

        IF (@NullRows + @ValidRows <> @Rows)
        BEGIN
            RAISERROR 30001 'cepsTrgUpdCannot update because primary key value not found in sufixos'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('cepsTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER cepsTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER cepsTrgUpd >>>'
go


