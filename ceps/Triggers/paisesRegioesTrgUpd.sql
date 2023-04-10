/* 
 * TRIGGER: [paisesRegioesTrgUpd] 
 */

CREATE TRIGGER [paisesRegioesTrgUpd] ON paisesRegioes
FOR UPDATE AS
BEGIN
    DECLARE
        @paiRegID int,
        @Rows      int,
        @NullRows  int,
        @ValidRows int

    SELECT @Rows = @@rowcount
    IF @Rows = 0
        RETURN

-- Child Update: RESTRICT

    IF (UPDATE(paiID))
    BEGIN
        SELECT @NullRows = COUNT(*)
          FROM inserted
          WHERE  inserted.paiID IS NULL

        SELECT @ValidRows = COUNT(*)
          FROM paises pr, inserted
          WHERE pr.paiID = inserted.paiID

        IF (@NullRows + @ValidRows <> @Rows)
        BEGIN
            RAISERROR 30001 'paisesRegioesTrgUpdCannot update because primary key value not found in paises'
            ROLLBACK TRAN
        END
    END
-- Child Update: RESTRICT

    IF (UPDATE(regID))
    BEGIN
        IF ((SELECT COUNT(*)
          FROM regioes pr, inserted
          WHERE pr.regID = inserted.regID) != @Rows)
        BEGIN
            RAISERROR 30001 'paisesRegioesTrgUpdCannot update because primary key value not found in regioes'
            ROLLBACK TRAN
        END
    END

END



go
IF OBJECT_ID('paisesRegioesTrgUpd') IS NOT NULL
    PRINT '<<< CREATED TRIGGER paisesRegioesTrgUpd >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER paisesRegioesTrgUpd >>>'
go


